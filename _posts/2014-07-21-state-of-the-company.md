---
layout: post

title: Spark — State of the company
cover_image: blog-cover.jpg

excerpt: Zach Supalla, Spark's CEO, shares some important updates about the company.

author:
  name: Zach Supalla
  twitter: zsupalla
  bio: Founder, CEO
  image: zach.jpg
---

Ok guys, this one's a doozy.

We've got some big announcements to share, and I thought it would be prudent to send you a letter. However, the letter has gotten quite long. So first, I present a summarized version:

- Spark as a company is growing up, and that's mostly a good thing.
- We recently announced Spark OS, our open source operating system for the Internet of Things (IoT). Spark OS takes the foundation we built with the Spark Core and expands upon it. Over the course of the rest of the year we'll be building out features for people deploying thousands of connected products or more.
- We recently released the [Spark Server](https://github.com/spark/spark-server), our open source back-end for the Spark Core. You can now run Spark Cores on your own infrastructure! If you want a commercial solution for large-scale deployments (>1K units), come [talk to us](mailto:sales@spark.io).
- We've just pushed out a major stability update called a "deep update". This update will patch the CC3000 Wi-Fi module and make the connection to the Spark Cloud more consistent. To receive the update, simply plug in your Spark Core and get it online, and then visit the [Spark Build IDE](https://www.spark.io/build) for instructions.
- Some investors decided to give us some money, which means that we can grow and take on new challenges. Hooray!

Now, for those who came for a story, let's dig in a bit deeper:

### State of the Company

On June 2, 2013, our Kickstarter campaign for the Spark Core campaign closed. Then the work really started.

One year later, we're a pretty different company. We've shipped more than 30,000 Spark Cores. We've grown from 4 employees to 12. Four companies have successfully launched products powered by Spark, and many more are in development. We have a manufacturing partner, distribution partners, logistics partners, and a handful of technology partners.

In many ways, we're growing up. We're starting to look like a real company. We have meetings and conference calls; we've got lawyers and a PR firm. This is all kind of a funny feeling, given that two years ago Spark was just me and a soldering iron. But it does lead to the question — what do we want to be when we grow up?

I'd like to share a page from my first pitch deck for Spark, created in February 2012. Here it is:

<div class="full"><img src="{{ site.url }}/images/pitchdeck.png"></div>

The big issue that I saw was that hardware manufacturers didn't have a technology partner to help make their products better. Without an OS, hardware is limited to its capabilities when the product is shipped. An operating system provides a way for people to build applications for the hardware, which gives us Microsoft Office on the PC, and Angry Birds on the smartphone.

This vision has remained pretty consistent, because we believe that connected devices and the Internet of Things is the next major frontier of technology, and in order for it to succeed, people need a great foundation upon which they can build amazing products. And that foundation needs to be:

- **Easy**. Because the point of what we're doing is to solve hard problems so that our customers don't have to.
- **Open**. Because if it's not open, we're just creating risk and anxiety for our customers.
- **Affordable**. Because if it's not, then this stuff won't ever catch on.

This is what we're shooting for. We want to take the foundation that we built for the Spark Core and expand upon it to provide a complete infrastructure for a connected product. We hope to solve as many technical challenges as we can so that we can lower the barrier to entry for connected products and help more engineers, start-ups, and corporations bring new products to market.

And with that comes our first major announcement:

### Spark OS

Two weeks ago [we announced](http://www.businessinsider.com/spark-raises-49-million-to-fuel-its-cloud-dreams-2014-7) a new initiative of sorts: Spark OS. A cloud-based operating system for connected products.

Spark OS is not your typical operating system. Most people think of an operating system as a software stack that runs on their CPU, like Windows or Android. The OS handles communications with various peripherals (your trackpad, your monitor, etc.) and provides a standard interface for the user and an interface for software developers to build apps.

Connected products also need an OS, because they need something to hook them together and provide an interface. However, the structure of the OS is different. Connected products have very limited memory (~20KB of RAM) and processing power, so they can't necessarily run Android or even Linux. But they have an internet connection, which means they can hook into services with a lot more horsepower.

<div class="full"><img src="{{ site.url }}/images/cloud-and-things.png"></div>

Spark OS is a distributed operating system. The OS covers three areas:

- **Device**: The Spark firmware libraries provide the connection to the Cloud. These firmware libraries are open source, and can provide an encrypted connection to a Cloud server on any system with a TCP/IP stack and 20KB of RAM.
- **Cloud**: Spark's cloud back-end routes messages to devices, and provides an application layer through the REST API so that software developers can create apps for Spark-powered products.
- **Interface**: Our mobile app templates and work-in-progress language wrappers act as SDKs for developing mobile and web interfaces for Spark-powered products.

Now, those of you who are familiar with us might say, "wait a second, isn't this the same thing you've been doing this whole time?" To some extent, yes. We didn't push out any major new features with this announcement; we've been steadily building features since we shipped late last year. So perhaps it's best to think of this re-branding as a statement of intent. Framing our tech stack as an operating system means that, as we continue to build out its features, our goal is to provide a complete end-to-end technical solution for a connected product.

Some features that you should expect to see us deploy over the rest of the year:

- **Workers**: The ability to create "workers", Node.js applications in the Cloud that can communicate with your Spark Core so that you don't have to serve your own web app.
- **Management tools**: If you've shipped thousands of products to customer, you need a administrative interface to do things like register devices, see logs, and push out firmware updates.
- **Data visualization**: Connected products produce a lot of data, so you need pretty charts!
- **New hardware**: Why should the Spark experience be limited to just Wi-Fi?

### Spark Server

It's been a long time coming, but last week we pushed out our open source back-end solution, the [Spark Server](http://www.github.com/spark/spark-server).

The Spark Server is a Node.js application that you can run on your local machine or on any hosted server that can act as a cloud back-end for your connected products. It's designed to be lightweight and easy to deploy, and we've published [instructions](https://github.com/spark/spark-server/blob/master/doc/raspberryPi.md) on how to set up a Raspberry Pi to run the Spark Server.

The Spark Server is open source, and published under an AGPL license. This license was chosen to deter others from creating proprietary clones of our platform; clones and spin-offs are welcome, but must also be open source.

If you are running a proprietary service and would like to use some of our tech stack, you still can; the [Spark protocol](https://github.com/spark/spark-protocol) is also open source, and published under an LGPL license, so that you can build a proprietary application around it. It just has to be substantially different from our own cloud service (i.e. not a clone).

If you're shipping a commercial product and are looking for either a highly scalable cloud infrastructure, or service and support from the Spark team, that's where our hosted platform comes in; [come talk to us!](mailto:sales@spark.io)

### Major stability upgrade: the deep update

Some customers have been plagued with stability issues since we first shipped the Spark Core late last year. These stability issues stem from a flaw in the CC3000 firmware, which was recently patched by TI.

We've wrapped this firmware patch in something that we're calling a "deep update". This is, essentially, a firmware update that includes the CC3000 patch, and instructions for installing it. You can now automatically download this update over the air, after which the Spark Core will reboot and come back online with a patched module.

If your Spark Core is black, you already have the firmware patch; however if you've got a white Spark Core and haven't applied the patch yourself, it's time to upgrade!

The next time you log into the [Spark Build IDE](https://www.spark.io/build), you'll be presented with an alert:

<div><img src="{{ site.url }}/images/alert.png"></div>

Click the big blue button, and you'll find that some or all of your Cores will have little arrows next to them. When your Core is online, click the arrow to upgrade!

### Spark's Series A

Our announcement of Spark OS a couple of weeks ago was paired with some other big news: [Spark has raised $4.9 million from investors](http://blogs.wsj.com/venturecapital/2014/07/08/spark-io-raises-4-9-million-to-help-engineers-make-their-devices-smart/), including Lion Wells Capital, O'Reilly Alpha Tech Ventures, SOSventures, and Collaborative Fund.

We couldn't be happier with the investors we've brought on board. These are not your typical VCs; they all understand our vision and how important our community is to us. A quick intro of each investor:

- **Lion Wells Capital**: Run by Avidan Ross, self-proclaimed investor/Maker. I met Avidan when he showed up at our demo day more than a year ago with a Roving Networks RN-171 in one hand and an Electric Imp in the other, and said "you're doing this right". Avidan has been a huge supporter since we launched the Spark Core, and I couldn't be happier to have him around.
- **O'Reilly Alpha Tech Ventures**: OATV is a top-notch early-stage VC in San Francisco, with close ties to O'Reilly Media, famous for their technology books, conferences, and websites. The team at OATV believes strongly that "innovation starts with enthusiasts", so they're a perfect match for us.
- **SOSventures**: These guys have been with us since the beginning: they're behind [HAXLR8R](http://www.haxlr8r.com), the hardware incubator in Shenzhen that got us started. They made a bet on us early on when all we had was a vision and a prototype, and we'll be forever grateful.
- **Collaborative Fund**: Collaborative Fund is one of the few investors with a clear social mission, focusing on investments with some aspect of creativity, collaboration, and strong values. Their money comes from passionate individuals like Nicholas Negroponte, Tony Hseih, and Pharrell Williams.

This investment provides us the opportunity to grow and take on bigger challenges. We're [hiring voraciously](http://jobs.lever.co/spark), so if you like where we're headed, come talk to us!

That's all for now; thanks for listening, and look forward to some great new features and products throughout the rest of the year!

Much love,

Zach (and the Spark team)
