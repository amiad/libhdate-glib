NULL = 

#Build in these directories:

SUBDIRS = \
	src \
	vapi \
	examples \
	$(NULL)

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libhdate-glib.pc

libhdate_glibdocdir = ${prefix}/doc/libhdate_glib
libhdate_glibdoc_DATA = \
	ChangeLog \
	README \
	COPYING \
	AUTHORS \
	INSTALL \
	NEWS\
	$(NULL)

EXTRA_DIST = \
	$(libhdate_glibdoc_DATA) \
	libhdate-glib.pc.in \
	$(NULL)

DISTCLEANFILES = \
	$(NULL)

