---
layout: post

title: Publish events from your Spark Core
cover_image: blog-cover.jpg

excerpt: Up until now, you could talk to your Spark Core, but it couldn't talk back. To showcase our newest feature, Spark.publish(), I build a connected motion detector.

author:
  name: Zach Supalla
  twitter: zsupalla
  bio: Founder, CEO
  image: zach.jpg
---

Last Friday, we wrapped up Sprint 8 on our team. We released a number of minor bug fixes and improvements, but the one major feature that we delivered is `Spark.publish()`. Here are some examples:

<script src="https://gist.github.com/cazzo/9495585.js">
</script>

Up until now, the only way to communicate with the Spark Core was to ask it something. You could remotely call a function using `Spark.function()`, such as calling the `brew()` function on a connected coffee-maker to brew a cup of coffee on the fly. Or you could store the temperature in a local variable `temp`, and then check the temperature with `Spark.variable()`, and ask for the temperature at any time.

But what if you want the Spark Core to talk to you? Enter `Spark.publish()`. This feature lets you publish events from the Spark Core, which can be subscribed to through the API. Events are published to a topic, and can be public or private.

To showcase this feature, I'm going to build a Spark-powered motion detector. Here's the hardware:

<div class="full"><img src="/images/core-and-pir-live.jpg"></div>

If you're following along, here's a Fritzing diagram showing how the components are wired.

<div class="full"><img src="/images/core-and-pir-fritzing.png"></div>

My goal is to have this motion detector inform me when it detects motion (natch). Perhaps it could even text me through Twilio? Hello, ad hoc security system.

First, I'll connect my Spark Core to my Wi-Fi network. I'm going to use the recently released Spark CLI. Once the CLI is installed through `npm install -g spark-cli`, I can start to play.

<img src="/images/setup.gif">

Now my Core is connected to the internet and to the Cloud, which I know because its little LED is breathing cyan. Breathing = happy and alive.

Next, it's time to develop my firmware. Adafruit has some [great resources](http://learn.adafruit.com/pir-passive-infrared-proximity-motion-sensor/) for using these sensors.

I threw together a quick 50-line application that will publish to the Cloud every time motion is detected. I chose `spark-hq/motion` as the topic; our team will use the top-level `spark-hq` topic for data generated at our office.

<script src="https://gist.github.com/cazzo/9496462.js">
</script>

Now I can subscribe to the stream of events using [Server-Sent Events](http://en.wikipedia.org/wiki/Server-sent_events). Using `curl` as an example, I type this in my terminal:


    curl -H "Authorization: Bearer {ACCESS_TOKEN_GOES_HERE}" \
             https://api.spark.io/v1/events/spark-hq


and now I'm listening to a stream of events from `spark-hq`. Besides my own motion sensor, we've got a temperature sensor (69 degrees!), and will be adding more as we put together more prototypes. Since this data is public, anyone can subscribe; go to the [Spark Build IDE](https://www.spark.io/build) and get your access token from the "Settings" panel, and you can subscribe to this data too!

<div class="full"><iframe width="720" height="405" src="//www.youtube.com/embed/V_z9AZYUk0w" frameborder="0" allowfullscreen="allowfullscreen">
</iframe></div>

Now I don't just want to see a stream of data in my terminal; I want to *do* something with it. Luckily, Server-Sent Events are part of the HTML5 protocol, and there are interfaces available in many programming languages. Check out [this tutorial from html5rocks](http://www.html5rocks.com/en/tutorials/eventsource/basics/) for more information on using Server-Sent Events.

### Coming soon: more features!

This is just the beginning for `Spark.publish()`. A few weeks from now we'll add even more functionality, such as:

- Setting up webhooks for events to POST a message back to your server
- `Spark.subscribe()`, so that devices can talk with one another

Let us know what you think and share your `Spark.publish()` projects on the [Spark Community](https://community.spark.io)!
