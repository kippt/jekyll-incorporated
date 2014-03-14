---
layout: post

title: Wow, much reliable, so better
cover_image: blog-cover.jpg

excerpt: "This week was about improving the robustness and reliability of the Spark Cloud and our firmware."

author:
  name: Zach Supalla
  twitter: zsupalla
  bio: Founder, CEO
  image: zach.jpg
---

We just completed our fourth sprint on the Spark platform, where our main focus was increasing the reliability and performance of the Cloud/Core combo. This involved improvements to a variety of areas, including the web IDE, the firmware, and our cross-compile service that builds binaries to be flashed onto the Core.

### Example apps in the IDE

The most visible enhancement we put in place during this sprint was adding example Core apps to the IDE that can you can fork and edit. Check it out:

<div class="full zoomable"><img src="{{ site.url }}/images/example-apps.png"></div>

When you open an example app, you can fork it into your own apps in order to edit it and flash it onto a Core.

<div class="full zoomable"><img src="{{ site.url }}/images/fork.png"></div>

These apps are populated from a Github repository at [github.com/spark/examples](http://www.github.com/spark/examples).

<div class="full zoomable"><img src="{{ site.url }}/images/github-examples.png"></div>

We are working on providing a mechanism to enable community contributions of example apps. In addition, this feature provides the first step toward libraries, a frequently requested feature; now that we have a linkage between the Spark IDE and Github, it opens up a lot of opportunities for collaborative coding through Spark.

### Proper authentication for multiple clients

Previously the Spark API put in place basic authentication where each user has one API token, which can be used to securely access and control that user's Spark Core.

<div class="full zoomable"><img src="{{ site.url }}/images/access-token.png"></div>

This feature, however, was limited to only one access token. This means that if multiple clients were to use the access token (for instance, the Spark iOS app and the user's own webapp), either one could request a new access token, revoking the previous token, and causing a failure in the other app.

This week, we implemented a feature allowing multiple clients. This means that two or more apps can request their own access token without revoking each others' access. Access tokens can be managed through the Spark API.

##### Generate a new access token

    POST /oauth/token

    # Using curl in your terminal
    curl https://api.spark.io/oauth/token -u spark:spark \
         -d grant_type=password -d username=joe@example.com \
         -d password=SuperSecret

    # A typical JSON response will look like this
    {
        "access_token": "254406f79c1999af65a7df4388971354f85cfee9",
        "token_type": "bearer",
        "expires_in": 7776000
    }

When creating a new access token, you need to specify several additional pieces of info.

You must give a valid client ID and password in HTTP Basic Auth.
Any client ID will work right now, so we suggest `spark:spark`.
In the POST body, you need three parameters:

* grant_type=password
* username=YOUR_EMAIL@ADDRE.SS
* password=YOUR_PASSWORD

For now, Spark Build will list the single most recently created token.


##### List all your tokens

    GET /v1/access_tokens

    # Using curl in your terminal
    curl https://api.spark.io/v1/access_tokens \
        -u joe@example.com:SuperSecret

    # Example JSON response
    [
        {
            "token": "b5b901e8760164e134199bc2c3dd1d228acf2d98",
            "expires_at": "2014-04-27T02:20:36.177Z",
            "client": "spark"
        },
        {
            "token": "ba54b6bb71a43b7612bdc7c972914604a078892b",
            "expires_at": "2014-04-27T06:31:08.991Z",
            "client": "spark"
        }
    ]

You can list all your access tokens by passing your email address and password
in an HTTP Basic Auth header to `/v1/access_tokens`.


##### Delete an access token


    DELETE /v1/access_tokens/:token

    # Using curl in your terminal
    curl https://api.spark.io/v1/access_tokens/b5b901e8760164e134199bc2c3dd1d228acf2d98 \
         -u joe@example.com:SuperSecret -X DELETE

    # Example JSON response
    {
        "ok": true
    }


If you have a bunch of unused tokens and want to clean up, you can delete tokens.

Just as for listing them, send your username and password in an HTTP Basic Auth header.

Complete documentation for authentication on the Spark API can be found on [our docs site](http://docs.spark.io/#/api/spark-cloud-api-authentication).

### More reliable firmware

Until this week, some users have been reporting an issue that has been referred to as the "Cyan Flash of Death". Due to an internal failure in the CC3000, on some networks after anytime from a few minutes to a few hours, the Core would go mute, and would be unresponsive until manually reset.

Because the underlying issue here is within the CC3000 where we do not have complete visibility, we are working with Texas Instruments to understand the root cause of the failure. In the meantime, we have issued a workaround; when the Core disconnects, it will now reset the Wi-Fi module so that it will recover. So while some users will still encounter occasional disconnects, they should now be temporary, and the Core will re-connect automatically within a minute or two.

We will be continuing to debug this issue during our next Sprint.

### Spark.disconnect() and Spark.connect()

In the Spark community, many users were requesting a mechanism to take control over the connection to the Spark Cloud. We have now implemented two functions, `Spark.disconnect()` and `Spark.connect()`, which will let users temporarily deactivate and re-activate the connection to the Spark Cloud.

### Better code parsing

Like the Arduino IDE, the Spark IDE has a pre-processor that adds a little magic to your code. The pre-processor automatically includes the Spark libraries and generates function prototypes that declare functions at the beginning of your code so that they can be used anywhere.

The pre-processor uses a bunch of regular expressions (regex), and previously had a few bugs, such as parsing functions within multi-line comments.

This week, the pre-processor went through an overhaul, so more of your code will compile successfully.

### Miscellaneous tweaks and improvements

In addition to the larger features and bugfixes above, we made a number of minor improvements, such as:

- The Spark Build IDE should now show a 'log in' screen rather than a 'sign up' screen if you've already been to the site and created an account/logged in before.
- We purchased a wildcard certificate so that we can register more domains. Now, [community.sparkdevices.com](http://community.sparkdevices.com) is [community.spark.io](http://community.spark.io)!
- We improved our staging environment for the Cloud, Core, and IDE. This won't have any direct effect on Spark users, since it is for internal development, but it does mean that we can better test changes internally before pushing them out.
- We merged a number of pull requests from the community, including [a fix to I2C addressing](https://community.spark.io/t/important-7-bit-i2c-addresses-are-now-working-01-24-2014/2376?u=zach). Some of our best features and bug fixes are generated by the community; we happily accept pull requests to our firmware and other open source software!

### Next up: Multiple files and further robustness improvements

As mentioned above, one of our most frequent feature requests is adding a capability for creating and sharing libraries for the Spark Core. While our example apps feature above was the first step, the next major step forward will be creating the capability for apps that include multiple files. This feature will be one of our top priorities during Sprint 5. Once this is complete, we will be able to link in community-generated libraries, most likely during Sprint 6.

In addition, while we have made a number of changes improving the robustness of the Spark Core, there's still work to do. During Sprint 5, we hope to squash the "Cyan Flash of Death" for good, and make other changes to ensure that the Spark Core stays connected and running your code consistently.
