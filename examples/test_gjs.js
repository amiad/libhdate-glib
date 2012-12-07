#!/usr/bin/gjs

const Hdate = imports.gi.LibHdateGlib.Hdate;
const HdateStringType = imports.gi.LibHdateGlib.HdateStringType;

var h = Hdate.new();
h.set_today();
h.set_use_hebrew(true);

print (h.to_string());
