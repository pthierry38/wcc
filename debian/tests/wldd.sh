#!/bin/sh
##
## test_wldd.sh
##
## Made by pret
## Login   <pret@thalesgroup.com>
##
## Started on  Wed 24 May 2017 01:50:45 PM CEST pret
## Last update Wed 24 May 2017 02:06:51 PM CEST pret
##


# its hard to check the exact content of the flags list given by
# wldd, as it may vary depending on the update of the target bin
result=`wldd /usr/sbin/sshd`

res=`echo $result|wc -l`

if [ $res -ne 1 ]; then
  echo "invalid output: $result"
  exit 1
fi

# result must be a list of linked libraries (-lxyz -lt1...)
# a library name can ontain alphanumeric values, underscrore and minus char
# only one space between libs
echo "$result"|grep -E "^(-l[a-zA-Z0-9_-]+ ){1,}$" >/dev/null

if [ $? -ne 0 ]; then
  echo "invalid output: $result"
  exit 2
fi

exit 0
