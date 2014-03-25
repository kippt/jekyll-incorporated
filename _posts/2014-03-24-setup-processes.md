---
layout: post

title: Setting up a Wi-Fi IoT product
cover_image: blog-cover.jpg

excerpt: There are a number of methods to set up connected devices that don't have a keyboard or screen, each with its own advantages and disadvantages.

author:
  name: Zach Supalla
  twitter: zsupalla
  bio: Founder, CEO
  image: zach.jpg
---

One of the biggest challenges with "connected devices" is that they can be a pain to set up. This is particularly true when the device connects to a Wi-Fi network, and it doesn't have a screen or a keyboard. How are you supposed to type in your SSID and password without a keyboard?

<div class="full zoomable"><img src="{{ site.url }}/images/chromecast.jpg"></div>

There are a number of different ways to accomplish this task, and a variety of products that have taken different directions. Unfortunately there is no accepted standard, and there probably won't be until this becomes part of the 802.11 spec. In the meantime, here are the available approaches, with their advantages and disadvantages:

### Soft AP

Perhaps the most common mechanism for setting up a connected device is to have it boot up as an Access Point. You then connect to its network, send in your Wi-Fi credentials, and re-connect back to your Wi-Fi network.

<div class="full"><img src="{{ site.url }}/images/twine-setup.png"></div>

Advantages:
- This is the closest thing there is to a standards-based process, so you can be relatively confident that it will work as expected.
- If you want to use the product without an existing Wi-Fi network, Soft AP mode might make this possible (see the Parrot AR.Drone)

Disadvantages:
- The process for setting up the device can be complicated, with many steps necessary, especially from a smartphone, where you have to manually switch to the settings panel and change the Wi-Fi network.
- Some of the cheapest Wi-Fi modules (like the Texas Instruments CC3000) do not have this capability, likely because it requires more RAM and/or processing power, which would make the chip more expensive.
- If you're setting up multiple devices, then the painful set-up process is compounded, because you would have to set up each one individually.

This method is used for the following devices:

- [Supermechanical Twine](http://www.supermechanical.com/twine)
- [Parrot AR.Drone 2.0](http://ardrone2.parrot.com/)
- [Google Chromecast](http://www.google.com/chromecast‎)

In my opinion, the best implementation of this process is the Google Chromecast, which uses a Chrome plug-in to make set-up extremely easy. The downside is that this process doesn't work on smartphones, so if a smartphone is your only way to connect to the device, the process is still relatively painful.

### WPS

A device can be added to a network using either a PIN number provided by the access point or a push-button method, where you press a button on the router. More recently you can also do WPS set-up using NFC on newer routers.

<img src="{{ site.url }}/images/wps.jpg">

Advantages:

- In theory, this process relatively simple and straightforward.
- You don't have to remember your Wi-Fi password, especially if it's one of those annoying long hex passwords that is used in the default configuration.

Disadvantages:
- Susceptible to [brute force attacks](http://www.kb.cert.org/vuls/id/723755) to discover the PIN.
- This process is not available on all routers. That means you can't rely on this set-up method being available everywhere.
- WPS has to be enabled on the router, which might require digging into the router settings.
- You must have physical access to your router. Just *try* asking your IT guy for this if you're not in a home environment.

### Smart Config

This is Texas Instrument's proprietary process for connecting a headless device to a Wi-Fi network. Set-up involves simply typing your Wi-Fi password and hitting "connect" on your smartphone. It's semi-magical, [encoding the data in the lengths of a barrage of UDP datagrams](http://electronics.stackexchange.com/questions/61704/how-does-ti-cc3000-wifi-smart-config-work).

This is the primary set-up process we use for the [Spark Core](http://www.spark.io), our CC3000-based Wi-Fi development kit.

<div class="full zoomable"><img src="{{ site.url }}/images/easy-setup.jpg"></div>

Advantages:

- When it works, it's magical. The easiest set-up process you could come up with that still has decent security in place.
- TI provides libraries for implementing this on iOS and Android.

Disadvantages:

- It doesn't always work. Namely it doesn't work on 802.11n MIMO networks, and really anytime your phone is transmitting at 5Ghz (because the CC3000 only has a 2.4Ghz antenna). It also is susceptible to areas with a lot of RF that might make it difficult to transmit uninterrupted UDP datagrams.
- It can take a while to work - up to 90 seconds - and the feedback that the user gets in the meantime is limited, which can be confusing.
- Currently iOS/Android/Java applet only, until TI decides to support more platforms.

### BlinkUp

[BlinkUp](https://electricimp.com/product/blinkup/) is [Electric Imp](http://www.electricimp.com)'s proprietary set-up process that uses light to transmit your Wi-Fi credentials to a product using a photosensor.

<div class="full"><img src="{{ site.url }}/images/blinkup.jpg"></div>

Advantages:

- BlinkUp is relatively simple and easy to use - not quite as easy as Smart Config, but not far off.
- BlinkUp gets some added security because your phone and the device have to be right up against each other for this to work. Your Wi-Fi credentials are therefore transmitted only a short distance.

Disadvantages:

- Doesn't always work, depending on the environment; you have to be in a somewhat dark room and have your two devices flush against each other. BlinkUp is reported to be a support issue for some of Imp's customers.
- Debugging can be challenging, because the process is inherently a one-way communications process. Feedback is somewhat limited.
- Although BlinkUp is a proprietary process, a company called [Revolv](https://revolv.com/) has a similar process which apparently is not licensed from Electric Imp; this might turn into a patent battle at some point, once Imp's patent goes through (I'm assuming it's still in process).
- BlinkUp is also used on the manufacturing line, which sounds slick, but creates manufacturing issues, as holding up an iPad over 10 devices is not part of most standard manufacturing processes.

### Bluetooth

### USB

### Add a screen and keyboard (ish)

### Recommendations
