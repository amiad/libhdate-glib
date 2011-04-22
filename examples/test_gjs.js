#!/usr/bin/gjs

const Hdate = imports.gi.LibHdateGlib.Hdate;
var h = Hdate.new();

print (h.get_format_date(0,0));
