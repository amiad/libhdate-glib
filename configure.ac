AC_INIT([libhdate-glib], [0.3.0], [kobi.zamir@gmail.com], [libhdate-glib])
AC_CONFIG_SRCDIR([Makefile.am])
AC_CONFIG_HEADERS(config.h)
AM_INIT_AUTOMAKE([dist-bzip2])
AM_MAINTAINER_MODE
 
AC_PROG_CC
AM_PROG_CC_C_O
AC_DISABLE_STATIC
AC_PROG_LIBTOOL

AC_PATH_PROG(VALAC, valac, valac)
AC_SUBST(VALAC)

VALAFLAGS+=" --pkg libhdate --vapidir=../vapi"

AC_SUBST(VALAFLAGS)
AC_SUBST(CFLAGS)
AC_SUBST(CPPFLAGS)
AC_SUBST(LDFLAGS)

GLIB_REQUIRED=2.12.0

AC_ARG_WITH(vala-pkg,
	[AS_HELP_STRING([--with-vala-pkg=PKG],
	[vala pkg-config package])])

if test "$with_vala_pkg" = "" ; then
	VALA_PKG="vala-0.10"
else
	VALA_PKG=$with_vala_pkg
fi

PKG_CHECK_MODULES(HDATE_GLIB, libhdate $VALA_PKG glib-2.0 >= $GLIB_REQUIRED gobject-2.0 >= $GLIB_REQUIRED)
AC_SUBST(HDATE_GLIB_CFLAGS)
AC_SUBST(HDATE_GLIB_LIBS)

GOBJECT_INTROSPECTION_CHECK([0.6.7])


VAPIDIR=`pkg-config --variable=vapidir $VALA_PKG`
AC_SUBST(VAPIDIR)

AC_CONFIG_FILES([Makefile
	libhdate-glib.pc
	vapi/Makefile
	examples/Makefile
	src/Makefile])

AC_OUTPUT

