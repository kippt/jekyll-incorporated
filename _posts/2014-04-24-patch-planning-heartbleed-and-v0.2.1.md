---
layout: post

title: Patch Planning + Heartbleed + v0.2.1
cover_image: blog-cover.jpg

excerpt: "The cloud team goes into the war room to prep for TI's release, and Heartbleed helps us learn about certificates."

author:
  name: Zachary Crockett
  twitter: towynlin
  bio: Founder, CTO
  image: zachary.jpg
---

## CC3000 patch deployment planning

The cloud team went into the war room during sprint 9, grabbed dry erase markers,
and started scribbling on everything.
Texas Instruments is finishing the quality assurance testing on the CFOD patch,
and it should be released very soon.
We needed to figure out how to deploy it, safely and as seamlessly as possible,
to as many users as possible, including those who don't even know what CFOD is.
Here's what we figured out.

* We'll create a new "deep update" feature in the web IDE that we can reuse for similar situations in the future.
* The update will be opt-in, with users specifically clicking a button in the web IDE to view instructions and perform the patch.
* For Cores that currently perform over-the-air updates reliably, the patch will happen wirelessly and seamlessly.
  The process will require some patience, but it should be happily automagical.
* There will also be a download + local USB patching option using `dfu-util` and the Spark CLI.
* We can't yet boot the Core back into the previous firmware, so the *Core will be running Tinker* after patching is finished.

To be clear, we don't have a finalized patch from TI, but we're getting ready anyway.
We hope to be ready to deploy a patch by the end of sprint 10 (May 2),
though the web IDE front end changes are complex enough that
they will probably bleed into sprint 11.
Speaking of blood...


## Heartbleed mitigation

So, if you haven't heard, it turns out there was an enormous, gaping hole in the
security systems of basically the entire internet for the past couple years,
[because bounds-checking](http://xkcd.com/1354/).
Some smart people saw it, felt a moment of dread/wide-eyed panic, patched it,
gave it a catchy name, a nice icon, a
[pretty website](http://heartbleed.com/),
and tried to spread the word as fast as they could.

<div class="full"><img src="/images/heartbleed.png"></div>

As soon as we heard on April 8, we started patching our systems,
and by that afternoon all Spark servers were no longer vulnerable.
During that part of the process, we upgraded OpenSSL to safe versions on all our servers,
especially the web-facing ones like api.spark.io and community.spark.io.

Then began the certificate dance.
Since OpenSSL has been vulnerable for years, we have to assume our TLS certificate keys
are compromised even though we have no evidence of an attack.

Many teams who manage servers, Spark included,
took this opportunity to try to level up the security standards.
On April 10th, we tried rotating the community certificate to one using an ECDSA key
for its cutting edge protections including mandatory forward secrecy.
However, we found many users' systems were incompatible with the new certificate,
so we quickly rolled back to the old certificate.
Lesson learned!

After some painfully slow back and forth with Comodo, our certificate authority,
(during which process we helped them identify a bug in their automated certificate generation systems)
they finally issued us a working certificate on April 21.
The new certificate has now been deployed to all Spark web servers and load balancers,
and the old certificates have been revoked.


## Firmware version 0.2.1

We deployed the latest and greatest firmware to the web IDE.
The tagged stable release is downloadable from the
[core-firmware releases](https://github.com/spark/core-firmware/releases)
page on GitHub.
You'll see commit links in the settings drawer if you click to expand the version.

<div class="full"><img src="/images/v0.2.1.png"/></div>

There were also some sweet features added to the Sparkulator itself.
My favorite? You can now download your compiled binaries and flash them over USB.
This complements the Spark CLI cloud compile feature to add an additional option
for those seeking a middle ground between coding, compiling, and flashing
*completely* in the cloud versus *completely* locally.

<div class="full"><img src="/images/download-firmware-binary.png"/></div>

Highlighted changes from v0.2.0 to v0.2.1:

* OTA reliability improvements
  ([core-firmware](https://github.com/spark/core-firmware/pull/155),
  [core-common-lib](https://github.com/spark/core-common-lib/pull/19),
  [core-communication-lib](https://github.com/spark/core-communication-lib/pull/8))
* Allow Spark.publish inside Spark.function
  ([core-communication-lib](https://github.com/spark/core-communication-lib/pull/13))
* Add Network.ping() ([core-firmware](https://github.com/spark/core-firmware/pull/156))
* Enable factory reset from firmware (only on new bootloader)
  ([core-common-lib](https://github.com/spark/core-common-lib/pull/21),
  [bootloader](https://github.com/spark/bootloader/pull/9))

Version 0.2.1 is being programmed on the current manufacturing run.

And lastly, speaking of manufacturing...


## The Stealth Core

Shhh... I've got a secret...

Promise not to tell?

So hawt...

Are you ready?

Check this out:

<div class="full"><img src="/images/stealth-core.jpg"></div>

### BOOM.

Starting next week, we'll be shipping out thousands of new Spark Cores to our anxiously awaiting customers! We'll finally have Cores in stock, so hopefully you'll never have to wait for a Core again!

This time around, the Cores (codename: **Stealth Core**) will be black. But don't worry - *nothing has changed other than the color.* The black Cores are identical to the previous white Cores, except they're black.

How come we changed the color? It's a long complicated story that gets way into the bowels of the supply chain, but basically, it turns out that white boards are difficult to manufacture, and our PCB fab house didn't want to make them anymore. For the near term, Spark Cores will be black - call it a Special Edition™ - and long term we're exploring some new custom color options so that we can make our boards look truly distinctive.

We'll let you know when Cores are shipping, and if you've got one on order, we hope you enjoy the new color!
