#!/usr/bin/gjs

const Hdate = imports.gi.LibHdateGlib.Hdate;
var h = Hdate.new();

h.set_gdate(2,12,2012)
print (h.get_format_date(0,0));
