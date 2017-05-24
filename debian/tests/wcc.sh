#!/bin/sh
##
## test_wcc.sh
##
## Made by pret
## Login   <pret@thalesgroup.com>
##
## Started on  Wed 24 May 2017 02:13:50 PM CEST pret
## Last update Wed 24 May 2017 02:19:39 PM CEST pret
##

TEMPDIR=`mktemp -d`

if [ -z "$TEMPDIR" ]; then
  echo "error creating temporary directory for test. leaving..."
  exit 1
fi

# create object file from ls binary
wcc -c /bin/ls -o ${TEMPDIR}/ls.o
# check object file state and content

# create shared object library from object file

# check shared object

# cleaning
rm -rf /tmp/${TEMPDIR}

exit 0
