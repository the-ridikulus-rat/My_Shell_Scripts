#!/bin/sh

set -x -e

run()
{
  repo=""
  ls --all -1 | while read -r repo
  do
    if [ -d "${PWD}/${repo}" ] && [ "${repo}" == ".git" ]
    then
        echo
        echo "${PWD}"
        echo
        git gc --aggressive
        echo
    elif [ -d "${PWD}/${repo}" ] && [ "${repo}" != "." ] && [ "${repo}" != ".." ]
    then   
        pushd ${repo} > /dev/null
	    run			
	    popd > /dev/null
    fi
  done
}

run

set +x +e
