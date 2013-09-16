car2go panels for Status Board
==============================

* index.rb: a styled map showing the location of car2go vehicles near the Panic office

![Map screenshot](index_screenshot.png)

* count.rb: the number of car2go vehicles near the Panic office

![Count screenshot](count_screenshot.png)

Installation
------------

You'll need to install the [Proj4](https://trac.osgeo.org/proj/) library before installing the required gems. It's available via Homebrew as "proj"

```
$ [sudo] bundle install
```

If you'd like a stand-alone version you can try [Aaron's Sinatra fork](https://github.com/aaronpk/statusboard_car2go).
