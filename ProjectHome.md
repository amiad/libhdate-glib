#### LibHdate Gobject bindings ####

Gobject bindings for LibHdate. LibHdate is a small C,C++ library for Hebrew calendar, dates, holidays, and reading sequence (parasha). http://libhdate.sourceforge.net/

#### Code examples ####
```
#!/usr/bin/ruby

require 'gir_ffi'

GirFFI.setup :LibHdateGlib
h = LibHdateGlib::Hdate.new
print h.to_string, "\n"
```

```
#!/usr/bin/gjs

const Hdate = imports.gi.LibHdateGlib.Hdate;
var h = Hdate.new();
print (h.to_string());
```

#### Hdate Gnome-shell example ####
Gnome-Hdate is a Gnome shell extention using libhdate-glib from java-script.


https://github.com/amiad/gnome-hdate


![http://libhdate-glib.googlecode.com/hg/examples/hdate@kobi/screenshot.png](http://libhdate-glib.googlecode.com/hg/examples/hdate@kobi/screenshot.png)