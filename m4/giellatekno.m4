# gt.m4 - Macros to locate and utilise giellatekno scripts -*- Autoconf -*-
# serial 1 (gtsvn-1)
# 
# Copyright © 2011 Divvun/Samediggi/UiT <bugs@divvun.no>.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# As a special exception to the GNU General Public License, if you
# distribute this file as part of a program that contains a
# configuration script generated by Autoconf, you may include it under
# the same distribution terms that you use for the rest of that program.

# the prefixes gt_*, _gt_* are reserved here for giellatekno variables and
# macros. It is the same as gettext and probably others, but I expect no
# collisions really.


AC_DEFUN([gt_PROG_SCRIPTS_PATHS],
         [
AC_ARG_VAR([GTHOME], [root directory of giellatekno scripts])
AC_ARG_VAR([GTCORE], [directory for giellatekno core data])
AC_PATH_PROG([GTVERSION], [gt-version.sh], [false],
             [$GTCORE/scripts/$PATH_SEPARATOR$GTHOME/newinfra/gtcore/scripts/])
AS_IF([test "x$GTSCRIPT" = xfalse], 
      [cat<<<EOT
could not find a giellatekno core scripts in:
       $GTCORE/scripts 
       $GTHOME/newinfra/gtcore/scripts 
       $PATH 
       please do at least first step of the following: 
       a. svn co https://victorio.uit.no/langtech/trunk/newinfra/gtcore
       b. cd gtcore/scripts && ./autogen.sh && ./configure && make install
       c. gtsetup.sh
EOT
       AC_MSG_ERROR([gtversion.sh could not be executed])])
]) # gt_PROG_SCRIPTS_PATHS

AC_DEFUN([gt_PROG_XFST],
[AC_ARG_WITH([xfst],
            [AS_HELP_STRING([--with-xfst=DIRECTORY],
                            [search xfst in DIRECTORY @<:@default=PATH@:>@])],
            [with_xfst=$withval],
            [with_xfst=check])
AC_PATH_PROG([PRINTF], [printf], [echo -n])
AC_PATH_PROG([XFST], [xfst], [false], [$PATH$PATH_SEPARATOR$with_xfst])
AC_PATH_PROG([TWOLC], [twolc], [false], [$PATH$PATH_SEPARATOR$with_xfst])
AC_PATH_PROG([LEXC], [lexc], [false], [$PATH$PATH_SEPARATOR$with_xfst])
AC_MSG_CHECKING([whether we can enable xfst building])
AM_CONDITIONAL([CAN_XFST], [test "x$XFST" != xfalse])
AS_IF([test "x$XFST" != xfalse], [AC_MSG_RESULT([yes])],
      [AC_MSG_RESULT([no])])
]) # gt_PROG_XFST

AC_DEFUN([gt_PROG_VISLCG3],
[AC_ARG_WITH([vislcg3],
            [AS_HELP_STRING([--with-vislcg3=DIRECTORY],
                            [search vislcg3 in DIRECTORY @<:@default=PATH@:>@])],
            [with_vislcg3=$withval],
            [with_vislcg3=check])
AC_PATH_PROG([VISLCG3_COMP], [cg-comp], [no], [$PATH$PATH_SEPARATOR$with_vislcg3])
AC_MSG_CHECKING([whether we can enable vislcg3 building])
AM_CONDITIONAL([CAN_VISLCG], [test "x$VISLCG3_COMP" != xno])
AS_IF([test "x$VISLCG3" != xno], [AC_MSG_RESULT([yes])],
      [AC_MSG_RESULT([no])])
]) # gt_PROG_VISLCG3

AC_DEFUN([gt_ENABLE_TOOLKITS],
[
AC_ARG_ENABLE([hfst],
              [AS_HELP_STRING([--enable-hfst],
                              [build with hfst tools @<:@default=no@:>@])],
              [enable_hfst=$enableval],
              [enable_hfst=no])
AM_CONDITIONAL([WANT_HFST], [test "x$enable_hfst" != xno])
AC_ARG_ENABLE([xfst],
              [AS_HELP_STRING([--enable-xfst],
                              [build with xfst tools @<:@default=yes@:>@])],
              [enable_xfst=$enableval],
              [enable_xfst=yes])
AM_CONDITIONAL([WANT_XFST], [test "x$enable_xfst" != xno])
]) # gt_ENABLE_TOOLKITS

AC_DEFUN([gt_ENABLE_TARGETS],
[
AC_ARG_ENABLE([morphology],
              [AS_HELP_STRING([--enable-morphology],
                              [build morphological analyser @<:@default=yes@:>@])],
              [enable_morphology=$enableval],
              [enable_morphology=yes])
AM_CONDITIONAL([WANT_MORPHOLOGY], [test "x$enable_morphology" != xno])
AC_ARG_ENABLE([generation],
              [AS_HELP_STRING([--enable-generation],
                              [build morphological analyser @<:@default=yes@:>@])],
              [enable_generation=$enableval],
              [enable_generation=yes])
AM_CONDITIONAL([WANT_GENERATION], [test "x$enable_generation" != xno])
AC_ARG_ENABLE([dictionary],
              [AS_HELP_STRING([--enable-dictionary],
                              [build morphological analyser @<:@default=yes@:>@])],
              [enable_dictionary=$enableval],
              [enable_dictionary=yes])
AM_CONDITIONAL([WANT_DICTIONARY], [test "x$enable_dictionary" != xno])
AC_ARG_ENABLE([voikko],
              [AS_HELP_STRING([--enable-voikko],
                              [build voikko support @<:@default=yes@:>@])],
              [enable_voikko=$enableval],
              [enable_voikko=yes])
AM_CONDITIONAL([WANT_VOIKKO], [test "x$enable_dictionary" != xno])

AS_IF([test "x$enable_voikko" = "xyes"], 
      [AC_PATH_PROG([ZIP], [zip], [false])
       AS_IF([test "x$ZIP" = "xfalse"],
             [AC_MSG_ERROR([zip is required for voikko speller packages])])])
]) # gt_ENABLE_TARGETS

AC_DEFUN([gt_PRINT_FOOTER],
[
cat<<EOF
-- Building $PACKAGE_STRING:
    * build with Xerox: $enable_xfst
    * build with HFST: $enable_hfst
    * morphological analyser: $enable_morphology
    * morphological generator: $enable_generation
    * dictionary: $enable_dictionary
    * voikko support: $enable_voikko
to build, test and install:
    make
    make check
    make install
EOF
]) # gt_PRINT_FOOTER
# vim: set ft=config: 
