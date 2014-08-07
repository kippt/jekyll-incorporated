---
layout: post

title: Controlling the connection
cover_image: blog-cover.jpg

excerpt: Take control of all the things! You can now easily take control of the connection on the Spark Core.

author:
  name: Zach Supalla
  twitter: zsupalla
  bio: Founder, CEO
  image: zach.jpg
---

One of our goals with the Spark Core and Spark OS was to abstract away the connectivity layer. When you're running a distributed OS where some of your software runs on the device and some of your software runs in the cloud, you want the connection between the two to "just work".

However, sometimes you don't want everything to be automatic; you want to take control of the connection, so you can decide when the device should try to connect and when it shouldn't. This is particularly helpful when you want your application code to start running immediately as soon as the device is powered, and the connectivity stuff can happen later on.

As of today, the Spark Core has three modes: `AUTOMATIC`, `SEMI_AUTOMATIC`, and `MANUAL`. Let's go through each of them in turn.

## Automatic mode

The default mode of the Spark Core is "automatic mode". This means that the Core will attempt to connect to Wi-Fi automatically. If you don't explicitly define the connection mode, the Core will be running in automatic mode. This is identical to how the Spark Core has always worked up until now.

Behind the scenes, what's running on the Spark Core looks something like this:

```cpp
void main() {
  // First, connect to the internet
  Spark.connect();

  // Then run the user-defined setup function
  setup();

  while (1) {
    // Then alternate between processing messages to and from the Cloud...
    Spark.process();

    // ...and running the user-defined loop function
    loop();

  }
}
```

But the whole point of the automatic mode is you don't really need to know that. The Wi-Fi connection just works. So let's say your code looks like this:

```cpp
// You don't have to add this, but if you want to be explicit:
SYSTEM_MODE(AUTOMATIC);

void setup() {
  pinMode(D7, OUTPUT);
}

void loop() {
  digitalWrite(D7, HIGH);
  delay(500);
  digitalWrite(D7, LOW);
  delay(500);
}
```

What's actually happening is that first we're calling `Spark.connect()`, which will connect the device to the Cloud. Once it's connected, then your code will run, and your `loop()` will alternate with `Spark.process()` so that we can process incoming messages in something that resembles a background process. (Side note: `Spark.process()` also runs during delays).

Ok, that's all well and good, but what if I don't know whether my Spark Core will have an internet connection? I still want my LED to blink. So now we've got:

## Semi-automatic mode

```cpp
// Insert firearm metaphor here
SYSTEM_MODE(SEMI_AUTOMATIC);

void setup() {
  pinMode(D7, OUTPUT);
  attachInterrupt(D0, connect, FALLING);
}

void loop() {
  digitalWrite(D7, HIGH);
  delay(500);
  digitalWrite(D7, LOW);
  delay(500);
}

void connect() {
  if (Spark.connected() == false) {
    Spark.connect();
  }
}
```

In this version of the code, when the Spark Core is plugged in, the LED will immediately start blinking. When a button attached to D0 is depressed (bringing DO to `LOW`), `Spark.connect()` will be called. If the Spark Core already has Wi-Fi credentials in memory, it will attempt to connect; otherwise, it will enter listening mode, and wait for your network name and password through the Spark mobile app or over USB.

The only main difference between `SEMI_AUTOMATIC` mode and `AUTOMATIC` mode is that `Spark.connect()` is not called at the beginning of your code; you have to do that yourself. Let's go deeper down the rabbit hole with:

## Manual mode

The Spark Core's manual mode puts everything in your hands. This mode gives you a lot of rope to hang yourself with, so tread cautiously.

Like `SEMI_AUTOMATIC` mode, in `MANUAL` mode you need to connect `Spark.connect()` yourself.
