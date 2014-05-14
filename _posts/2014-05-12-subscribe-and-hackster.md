---
layout: post

title: Spark.subscribe + spark.hackster.io
cover_image: blog-cover.jpg

excerpt: "Core-to-Core pub-sub push messaging released in core-firmware v0.2.2, and there's a new Spark Projects site powered by hackster.io!"

author:
  name: Zachary Crockett
  twitter: towynlin
  bio: Founder, CTO
  image: zachary.jpg
---

## Spark.subscribe()

The Spark team is super proud to release in
[v0.2.2](https://github.com/spark/core-firmware/releases/tag/spark_5)
a much anticipated feature: `Spark.subscribe()`.
Now it's easier than ever to pass messages from one Core to another.

If you've worked with `Spark.function()`, this will look very familiar.
Just write your own event handling function, and register it in `setup()`.
Here's an example where the event handler is called `ledOn()`:

    int onTime = -10000;

    void ledOn(const char *event, const char *data) {
      onTime = millis();
    }

    void setup() {
      pinMode(D7, OUTPUT);
      Spark.subscribe("light-up", ledOn, MY_DEVICES);
    }

    void loop() {
      bool isOn = digitalRead(D7);
      if (millis() - onTime < 500) {
        if (!isOn) {
          digitalWrite(D7, HIGH);
        }
      } else {
        if (isOn) {
          digitalWrite(D7, LOW);
        }
      }
    }

In `setup()` I subscribe to the "light-up" event.
By adding `MY_DEVICES` to the subscription call,
I make sure other people's Cores can't turn on my LED.
Now whenever any of my Cores publishes "light-up",
the Cloud will send that event to my Core, which will call `ledOn()`

The `loop()` just checks whether we updated the variable `onTime` within the last half second.
If so, and if the LED is off, we turn it on.
The else clause just turns the LED off half a second later.

Now I install the following firmware on a different Core to publish the "light-up" event.

    int last;
    bool ready;

    void setup() {
      pinMode(D3, INPUT);
      last = millis();
      ready = true;
    }

    void loop() {
      if (millis() - last > 200) {
        if (digitalRead(D3)) {
          // button pressed
          if (ready) {
            ready = false;
            Spark.publish("light-up");
            last = millis();
          }
        } else {
          // button released
          ready = true;
        }
      }
    }

I wire a button between 3V3 and D3 and add a pull-down resistor between D3 and GND.
That way, D3 stays low most of the time, but it goes high while the button is pressed.

The code simply listens for D3 to go high and publishes "light-up" when it does.
The `last` variable is used to debounce the button,
making sure we don't rapidly publish lots of events on the rising edge.
The `ready` variable ensures only one event per button press—you
have to release the button before `ready` becomes true again.

Here's a video of it working.
The Spark Core on the right publishes; the one on the left subscribes.

<iframe src="//player.vimeo.com/video/95062541" width="500" height="281" frameborder="0" allowfullscreen="allowfullscreen">&nbsp;</iframe>

Check out the [full `Spark.subscribe()` documentation](http://docs.spark.io/#/firmware/data-and-control-spark-subscribe).


## Spark Projects powered by hackster.io

We have partnered with the team over at hackster.io to create
[the official place to post all your Spark Core projects](http://spark.hackster.io/).
The hackster team has been great to work with, and they have created a custom view specifically for us.
Check out [spark.hackster.io](http://spark.hackster.io/) now—it's awesome!

Some great ideas are already there, like the
[BDub's Facebook Likes Push-up Man](http://www.hackster.io/bdub/facebook-likes-alert),
[ninedof's LCD tutorial](http://www.hackster.io/projects/e/ninedof/configurable-spark-core-connected-lcd),
[Rudolf Wirz's Twitter Torch](http://www.hackster.io/projects/e/rudolf-wirz/twitter-torch),
and
[Dragonsshout's Spark Door access control system](http://www.hackster.io/projects/e/dragonsshout/spark-door-access-control-system)!

Add yours and give some "respect"—hackster's version of like/star/+1—to your favorite projects now!
