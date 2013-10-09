---
layout: post
title: Jekyll Incorporated Features
subtitle: "What's in the box"
cover_image: blog-cover.jpg

excerpt: Features

author:
  name: Karri Saarinen
  twitter: karrisaarinen
  gplus: 100687498195339762535
  bio: Co-founder, Design

---


### Beautiful & Flexible Design

* Great typography

#### Configurable & Code Snipped Highlighting

/assets/Stylesheets/main.scss:
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

### Responsive


### SEO & Sharing friendly

### Optimized Performance


{% highlight ruby %}
    
{% endhighlight %}
