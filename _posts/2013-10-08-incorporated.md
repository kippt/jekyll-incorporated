---
layout: post

title: Jekyll Incorporated Features
subtitle: "What's in the box"
cover_image: blog-cover.jpg

excerpt: "Incorporated provides a great typography, responsive design, author details, semantic markup and more."

author:
  name: Karri Saarinen
  twitter: karrisaarinen
  gplus: 100687498195339762535 
  bio: Co-founder, Design
  image: ks.png
---

Incorporated provides a great typography, responsive design, author details, semantic markup and more.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam augue libero, tincidunt non massa vel,
varius ornare est. Vivamus elementum orci in commodo pharetra. Proin lorem lorem, convallis sit amet
elementum at, rhoncus ac nibh. Nunc elementum ante velit, non pretium elit aliquam sit amet. Sed dapibus,
augue eu commodo varius, libero dolor varius nunc, vitae vehicula neque nisl sed quam. Aliquam leo nisl,
vestibulum ut sollicitudin vitae, sodales a mauris. Duis quis massa elementum, tristique urna a, tincidunt
quam. Suspendisse potenti.

Nunc volutpat arcu massa, vitae dignissim libero viverra vel. Aenean magna ipsum, auctor fringilla risus
luctus, sagittis sodales mi. Aenean lobortis pharetra diam, et sodales ante porta sit amet. Aliquam adipiscing
posuere semper. Vivamus et nisi quam. Ut placerat luctus ante. Morbi feugiat nisl sed sem tempor feugiat vitae
eu nulla. Nam sed aliquet enim. Donec lorem nisl, tincidunt quis metus ultricies, vulputate porta magna. Nullam
erat dolor, elementum et consectetur a, fermentum a est. Nam ornare mi sit amet turpis tempus gravida. Donec
venenatis id est ut egestas. Nulla auctor fringilla tortor, a consectetur mauris consectetur molestie. Sed
molestie elit vitae pulvinar imperdiet. Quisque mauris sem, bibendum eget ornare at, blandit sit amet quam.
Nulla faucibus sed nisl vitae fermentum.

You can set customize post covers, and other things directly in the post front matter:

{% highlight yaml %}
layout: post

title: Jekyll Incorporated Features
subtitle: "What's in the box"

# Setup post cover image in /images/
cover_image: blog-cover.jpg

excerpt: "Incorporated provides a great typography, responsive design, author details, semantic markup and more."

# Author details, including Google Plus authorship
author:
  name: Karri Saarinen
  twitter: karrisaarinen
  gplus: 100687498195339762535 
  bio: Co-founder, Design
  image: ks.jpg
  
# Keep it as draft, not published in index.html or feed.xml
draft: false
{% endhighlight %}

#### Configurable & Code Snipped Highlighting

/assets/stylesheets/main.scss:
{% highlight scss %}

/* Bodytext font */
$font: "Droid Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;

/* Font for headings */
$fontheadings: "Droid Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;

/* Text colors */
$text: #21272d;
$textmuted: #848484;
$accent: #2077b2;    
{% endhighlight %}

config.yml:
{% highlight yaml %}
inc:
  # Blog Information
  title:        "Jekyll Incorporated"
  subtitle:     "Modern Jekyll based blog for companies"
  cover_image:  blog-cover.jpg
  
  # Company information
  company:      Incorporated
  url:          http://incorporated.sendtoinc.com/
  facebook:     sendtoinc
  twitter:      sendtoinc
  about_link:   https://sendtoinc.com/about/
  
  # Product Information
  product_link: http://incorporated.sendtoinc.com/
  tagline:      "Get a modern blog for your company"
  
  # Comments
  disqus:
    # Eg. "exampleblog" Set to false to disable comments
    shortname:  false
  
  
  # Sharing settings
  sharing:
    twitter:    false
    facebook:   false
    gplus:      false
    hn:         false
    
  
 # Analytics     
  analytics:
    google: 
      # eg. 'UA-123-12'
      id:       false    
{% endhighlight %}

**Zoomable images**

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lectus elit, elementum aliquam erat non,
aliquam sodales libero. In aliquet nec tortor sit amet mollis. Maecenas sodales at nulla vitae congue. Lorem
ipsum dolor sit amet, consectetur adipiscing elit. Nam adipiscing, elit vel rhoncus dictum, nisi dui tristique
lacus, et rhoncus lacus tellus ac risus. Aliquam sit amet condimentum orci. Suspendisse nec orci mauris.
Phasellus orci arcu, vehicula suscipit iaculis ut, pharetra ac urna.

<div class="full zoomable"><img src="/images/incorporated.jpg"></div>

**Awesome quotes**

> “Effective companies tend to communicate more, their people are curious and they have opinions”

Stay tuned for updates.