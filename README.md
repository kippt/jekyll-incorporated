# Jekyll Incorporated
Modern Jekyll based blog. Great for companies, products or anything. See live at [blog.sendtoinc.com](http://blog.sendtoinc.com)

## Contributing (Spark Team Flow)

1. Get repo: `git clone ...`
1. Get changes: `git pull`
1. Fork a branch from master: `git checkout master` and `git checkout -b feature/spark-telegraph`
1. Write Markdown Content in `_posts` dir
1. Verify it looks good locally ( see instructions below )
1. Deploy to Staging ( see instructions below)
1. Deploy to production ( see instructions below)
 
## Installation & Usage
    bundle install
    jekyll serve --watch

_Note: Requires Ruby version 1.9.3 =>. For example use [rbenv](https://github.com/sstephenson/rbenv)_

## Configuration
Edit: _config.yml (general options), main.css (theme colors &amp; fonts)

```
jekyll-incorporated/
├── _config.yml
├── _assets/
    ├── stylesheets/
        ├── main.scss
```

_Note: when editing _config.yml, you need to restart jekyll to see the changes.__


## Publish to Github Pages
1. Add your domain to _CNAME_
2. Edit your repo address at _Rakefile_

Run rake task. **NOTE: It will deploy the generated site to _gh-pages_ branch overwriting it**
```
rake site:publish
```

## Publish to staging

This will publish not to blog.spark.io, but to spark.github.io/staging-blog

Run rake task. **NOTE: It will deploy the generated site to _gh-pages_ branch overwriting it**
```
rake site:staging
```

Run rake

## Authors

Originally build for [sendtoinc.com](https://sendtoinc.com), your workspace for sharing and organizing knowledge

**Karri Saarinen**

+ [http://twitter.com/karrisaarinen](http://twitter.com/karrisaarinen)
+ [http://github.com/ksaa](http://github.com/ksaa)

**Jori Lallo**

+ [http://twitter.com/jorilallo](http://twitter.com/jorilallo)
+ [http://github.com/jorde](http://github.com/jorilallo)

## Todo:

+ Documentation
+ Less config files
+ Better deploy scripts

## Copyright and license

Copyright 2013 Kippt Inc. under [The MIT License ](LICENSE)
