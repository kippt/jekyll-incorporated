---
layout: post

title: We're on Maker Shed! Also, Will teaches you to Spark. Also, command line goodness. Also, more.
cover_image: blog-cover.jpg

excerpt: "Been trying to get your hands on a Spark Core? Get yours now at Maker Shed, and party from the command line like it's 1987."

author:
  name: Zach Supalla
  twitter: zsupalla
  bio: Founder, CEO
  image: zach.jpg
---

We're all pretty big nerds at Spark HQ, so it was pretty cool to see this in my inbox on Thursday.

### Spark Core on Maker Shed!

<div class="full"><img src="{{ site.url }}/images/maker-shed.jpg"></div>

Maker Media is kind of a big deal in our little corner of the world, and they've been supporters of ours for a while. Behind the scenes we've been working with them for quite some time to get the Spark Core on their shelves.

We're pleased to announce that the [Spark Core](http://www.makershed.com/Spark_Core_Chip_Antenna_p/mkspk01.htm) and [Spark Maker Kit](http://www.makershed.com/Maker_Kit_with_Chip_Antenna_Core_p/mkspk05.htm) are both available for purchase on Maker Shed!

We hear they're selling fast, and they will likely be sold out in the very near future --- so get yours now before that happens!

### Getting started with Will

<iframe width="560" height="315" src="//www.youtube.com/embed/Bxda0hXtJz8" frameborder="0" allowfullscreen="allowfullscreen">&nbsp;</iframe>

Will, the tallest member of the Spark team, put together an amazing 'Getting Started' video that walks through the set-up process of the Spark Core. This is the first of many video tutorials, as we've found that there's no better way to learn than to follow along!

### Spark Command Line Interface (CLI)

Speaking of big nerds, we love the command line. If you spend a lot of time writing code, you often find that graphics just get in the way of the pureness that is text.

This week, we're officially launching the Spark Command Line Interface, or CLI. The CLI is still in active development, so expect significant changes over the next few weeks. In the meantime, the CLI is now the fastest and easiest way to get started with your Spark Core.

Before getting started with the CLI, you'll need to have [Node.js](http://nodejs.org/) and [npm](https://www.npmjs.org/) installed. Go ahead, I'll wait here.

Ready? Try this:

`npm install -g spark-cli`

Now you've got the Spark CLI installed. Next:

`spark`

will tell you all the commands available. Here are some of my favorites:

`spark cloud login` to log in to your Spark account so that you can interact with your Cores.

`spark cloud list` returns a list of the Cores you own, and displays information about their status. statuses. statii?

`spark cloud flash 0123456789ABCDEFGHI core-firmware.bin` will flash your Core with a binary file of your choosing. Or you can flash `my_application.ino` to send a single Arduino file, or `/projects/big_app/src` to send an entire directory.

`spark variable get all temperature` returns the temperature variable from all available Cores.

`spark serial wifi` will help you connect your Core to your Wi-Fi network.

There's lots more where that came from; for a full list of available commands, simply type `spark` in your terminal, or visit the [Github repository](https://github.com/spark/spark-cli).

And speaking of Github...

### Our open source has a new home

<div class="full"><img src="{{ site.url }}/images/spark-source.png"></div>

As the volume of our open source content grows, it's become a little unwieldy. Now if you'd like to browse our open source repositories, visit [spark.github.io](http://spark.github.io) to see an organized view of the open source tech stack for connected devices that we've been publishing over the last few months.

Using the Github tools we've made available, you can star a repository to follow it for changes, create an issue to request a feature or share a bug, or track our workflow on [waffle.io](http://www.waffle.io).

<div class="full"><img src="{{ site.url }}/images/waffle.png"></div>

Starting with the [core-firmware](https://www.github.com/spark/core-firmware) repository, we're sharing our backlog with the community to get your feedback about our priorities and to get your help and input wherever you're willing to provide it. Workflows for other repositories will go live over the next couple of weeks.

### Other stuff

There were a few other things - improvements to the documentation, web IDE improvements to no longer send .cpp files through the Arduino pre-processor, API improvements, and bug fixes. But who can keep track?

Enjoy the improvements, and if you have any feedback, please share it in [the community](https://community.spark.io)!
