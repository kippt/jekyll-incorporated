---
layout: post

title: So many new features!
subtitle: "And improving documentation"
cover_image: blog-cover.jpg

excerpt: "Improvements to the web IDE, lots of documentation, Cloud status site, and firmware RGB LED control."

author:
  name: Zachary Crockett
  twitter: towynlin
  bio: Founder, CTO, coder-composer
  image: zachary.jpg
---

So much to share from this sprint!
The last two weeks have been a whirlwind.
First of all, we have a new blog!  Welcome.

## Web IDE

Three new features: you can now claim, unclaim, and rename Cores through Spark Build.
Other improvements:

- Clearer error messages on Flash/Verify
- Case insensitive usernames
- Flash automatically saves
- Verify and Flash are ten times faster!
   - We incorporated the winning makefile [feature bounty](https://community.sparkdevices.com/t/feature-bounty-improve-our-makefile/567) pull request from [Matt Anderson](https://community.sparkdevices.com/users/mattande/activity) into the compile server.
   - We don't recompile your firmware if you haven't edited the code. First hitting Verify, then hitting Flash now only results in one compile cycle.

## Documentation

We added some great docs to help users better
understand the colors of the RGB LED on the Core.

- On the "Connecting your Core" page,
  there's a new, highly detailed section called
  [Troubleshooting by Color](http://docs.spark.io/#/connect/troubleshooting-by-color)
  that helps you understand exactly what's happening.
- On the "Getting Started" page, in
  [Step 3](http://docs.spark.io/#/start/step-3-connect-the-core-to-wi-fi),
  we added a click-through animation of the Core's flashing/breathing LED
  to show all the steps one sees when setting up a Core the first time.

There's also a
[new annotated example](http://docs.spark.io/#/examples/local-communication)
showing how to do local communicaton with your Core.
Simple [example servers](https://github.com/spark/local-communication-example)
are on GitHub in ruby and node.js.

Two big forum posts in case you missed them:

- [Troubleshooting Guide](https://community.sparkdevices.com/t/spark-core-troubleshooting-guide-spark-team/696)
- [SparkBot = Spark Core + Roomba](https://community.sparkdevices.com/t/sparkbot-spark-core-roomba/625)

## Firmware Improvements

You now have control over the RGB LED on the Core!
To stop breathing cyan and turn it red for half a second:

    RGB.control(true);
    RGB.color(255, 0, 0);
    delay(500);
    RGB.control(false);

We'll add this to the docs soon, but the arguments
to `RGB.color()` are red, green, and blue values 0–255.

We also improved the USB Serial Wi-Fi credentials tool;
it now supports WPA2, WPA, WEP and unsecured networks.

Newly implemented Arduino/Wiring functions:

- delayMicroseconds()
- micros()
- shiftIn()
- shiftOut()

Also, you can now easily get your Core ID in firmware with `Spark.deviceID()`.

We released an open source patch programmer for upgrading the CC3000 firmware.

We improved the stability of over-the-air firmware updates in the face of lossy networks.

## Cloud

You can check the health status of the Spark Cloud at
[status.spark.io](http://status.spark.io/)

We squashed some memory leaks in the Device Service
so your Core connection is now stable for longer.

## Mobile Apps

The Android app can now handle unsecured Wi-Fi networks.

Open sourcing the mobile apps is high on the priority list,
but we're blocked by licensing issues right now.
More info in January, but we will likely release
the Android app first and the iOS app later.
