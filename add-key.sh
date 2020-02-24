#!/bin/bash

FILES=*.asc
count=`ls -1 $FILES 2>/dev/null | wc -l`

# git clone secret-repo
# if [[ ! -d git-secret-repo ]]; then
#     git clone --quiet git@github.com:dwpdigital/git-secret-repo \
#     && cd git-secret-repo
# else
#     cd git-secret-repo
#     git fetch --quiet
# fi

shopt -s nullglob
if [ $count != 0 ]; then
    for f in $FILES
    do
      GPG_EMAIL=$(gpg $f | grep -o -P '(?<=<).*(?=>)')
      gpg --import $f \
      && git secret tell $GPG_EMAIL
    done
fi