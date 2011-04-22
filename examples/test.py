#!/usr/bin/python

from  gi.repository.LibHdateGlib import Hdate
h = Hdate.new()

print (h.get_format_date(0,0));
