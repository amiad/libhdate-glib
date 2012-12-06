#!/usr/bin/gjs

const Hdate = imports.gi.LibHdateGlib.Hdate;

var h = Hdate.new();
h.set_gdate(0, 0, 0);

print (h.get_format_date(0,0));

h.set_gdate(1, 1, 2013);

print (h.get_format_date(0,0));

print (h.get_string(0, 5773, false, true));

