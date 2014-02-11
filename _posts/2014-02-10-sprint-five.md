---
layout: post

title: Multiple files in the IDE, open source Android app, and more
cover_image: blog-cover.jpg

excerpt: "Two major releases this week that are leading the way towards more open source awesome."

author:
  name: Zach Supalla
  twitter: zsupalla
  bio: Founder, CEO
  image: zach.jpg
---

As promised last time around, a major focus of Sprint 5 was to deliver "multiple files" in the web IDE. Consider it delivered!

### Multiple files in the Spark IDE

<div class="full zoomable"><img src="/images/multi-files.png"></div>

See that little + icon at the top of the screen? Give that the old clickety-click and you'll find yourself with multiple files.

The Spark Build IDE automatically adds two files to your project: a header file (.h) and a C++ file (.cpp). The IDE also automatically adds a `#include` statement at the top of your main application that brings in the header file.

This means that, as members of the community begin to create libraries for various components and accessories like sensors, LCD displays, etc., you can add them as separate files to keep your code clean. This can also help you keep yourself organized as your applications become more complex.

This is the first step on a longer journey to make it easy to import and share libraries with the rest of the community. Most of our team is web guys, and we love tools like Node.js's `npm` and Ruby's `gem` that make it extremely easy to share libraries. This makes it possible for developers and engineers to stand on each others' shoulders. We hope to deliver the same simple solution through Spark's in-process library system.

### Android app: now open source!

<div class="full zoomable"><img src="/images/android-app.png"></div>

The Spark Android app is now open source, ready to act as a template for your own mobile apps for your Spark-powered products.

[Spark Android app on Github](https://github.com/spark/android-app)

We haven't yet been able to secure permission to re-distribute TI's Smart Config libraries, so they have been removed from the open source project, along with Gotham, the fonts we used to make it all pretty. If you're building the Android app yourself, please follow the README to re-introduce these assets and make sure that the project will be able to build successfully.

Don't worry, iOS fans - the open source iOS app will be coming soon, too!

### Next time: more documentation, a command line interface, Spark.publish(), and more!

We've got a lot on the docket for Sprint 6, including a number of features that we've been excited about for quite some time. Here's what to expect over the next few weeks:

- We'll be making lots of improvements and fixes to our documentation, including creating an oft-requested "getting started" screencast
- We've got a Command Line Interface (CLI) in the works that will dramatically simplify the process of interacting with your Spark Core locally and through the Cloud.
- Perhaps our most-requested feature: `Spark.publish()`, a mechanism to publish data from the Spark Core to your favorite web service (formerly known as `Spark.event()`)
- We're start on a mechanism for sharing community-generated libraries within the IDE
- Debugging CFOD, the "Cyan Flash of Death" - we're getting closer to squashing it!
- Various IDE bug fixes
- Various Core firmware bug fixes (mostly relating to connectivity)

Enjoy the improvements, and if you have any feedback, please share it in [the community](https://community.spark.io)!