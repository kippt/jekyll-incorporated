---
layout: post

title: Building an open source Nest
subtitle: ""
cover_image: blog-cover.jpg

excerpt: "Inspired by the Google acquisition of Nest for $3.2Bn, the Spark team set out to build an intelligent learning thermostat in less than 24 hours."

author:
  name: The Spark Team
  twitter: sparkdevices
---

## Why we made a thermostat

Earlier this week, Google bought Nest, a connected devices company, for $3.2 billion. This might seem like an ungodly sum for a company that makes thermostats and smoke detectors, but it makes sense. Nest was the first company to figure out what the "Internet of Things" means to consumers and deliver products that people actually want.

What is the "Internet of Things"? It's the concept that one day, everything that we interact with on a day-to-day basis — doors, mailboxes, coffeemakers, etc. — will be connected to the Internet. Nest honed in early on a valuable product to bring online - the thermostat - because they realized that by doing so they could both make people more comfortable in their homes and save serious money on their energy bills.

But in order to do this, Nest had to spend millions of dollars on R&D to build the basic infrastructure behind the product. That made it impossible for anyone but the extremely well-capitalized to enter the market and create connected things.

Well, we want to change that. At Spark, we're making it easier to bring connected devices to market with the Spark Core, our Wi-Fi development kit, and the Spark Cloud, our cloud service for connected devices. And to prove it, we built our own crude approximation of the Nest Learning Thermostat in one day — and we've open sourced everything. In this process, we've come to respect the incredible technical challenges that Nest has solved while also coming to understand how much the game has changed since they first started.

This may seem like a crude hack, but remember - every polished product starts as a rough prototype.

## What you'll need to get started

Building a connected device requires three things. First, you need hardware. In our case, that means sensors for temperature and humidity, plus a motion sensor to figure out whether you're home, and relays to control the furnace and the fan. We also need a display so you can see the current temperature, and an enclosure to protect the messy bits. In our case we're using CNC milled wood and laser-cut acrylic.

Next, you need software. Some of this software runs on the thermostat, reading data from the sensors, controlling the relays, and displaying data on the screen. But since this is a connected thermostat, we also want a web interface so that it can be controlled from your smartphone or computer. And since it's a learning thermostat, we also want to do some machine learning so that we can over time improve your comfort and energy efficiency. This software will run in the cloud.

And finally, you need connectivity. We're using our own development kit, the Spark Core, which connects to the Spark Cloud. This lets us link the hardware to our web app and machine learning algorithms, so that the thermostat becomes an extension of the code that we wrote that lives in the web.


## Step 1: Get excited, crazy things are possible.

When we first conceived of the idea to conduct a Spark Team hackathon to build an intelligent thermostat in a day, it seemed completely rediculous, irreverent, and impossible.  But as each of us speculated about the the software, hardware, and connectivity challenges we'd face, we gradually widdled away the complexity and realized that it was possible. We knew we wouldn't be able to build a product ready for mass market in a day, however, we could design and build something that would satiate our imaginations, and plant a seed for others.  Though the reality of 24 hours is harsh and unrealistic, we didn't let that fact cloud our mindset into thinking in terms of a throwaway DIY project; we set out to build a real product.

## Enough then, show me.


