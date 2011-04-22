NULL = 

AM_CPPFLAGS = \
	$(HDATE_GLIB_CFLAGS) \
	-include $(CONFIG_HEADER) \
	$(NULL)

lib_LTLIBRARIES = libhdate_glib.la

include_HEADERS = hdate-glib.h

libhdate_glib_la_VALAFLAGS = --library hdate-glib -H hdate-glib.h --vapi=../vapi/libhdate-glib.vapi

libhdate_glib_la_SOURCES = \
	hdate-glib.vala \
	$(NULL)

libhdate_glib_la_LIBADD = \
	$(HDATE_GLIB_LIBS) \
	$(NULL)

EXTRA_DIST = \
	$(NULL)

DISTCLEANFILES = \
	$(NULL)

