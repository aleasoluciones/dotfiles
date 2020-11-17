#!/bin/bash

function git_pull_rebase_subdirectories {
        not_pullable_directories=('personal', 'go', 'sipwise', 'svn', 'spada', '__MACOSX')
        echo 'STARTING pulling from' $1
        cd $1
        number_of_failures=0
        declare -a failures
        for FILE in `ls -l`
	 do
	    if test -d $FILE && [[ ! ${not_pullable_directories[*]} =~ $FILE ]]
	       then
		  echo "Pulling $FILE..."
          cd $FILE && 
          git pull --rebase
          OUT=$?
          if [ $OUT -ne 0 ];then
              echo "Pull not possible, probably there is something to be stashed"
              failures[$number_of_failures]=$FILE
              (( number_of_failures++ ))
          fi
          cd ..          
	    fi
	done
    echo 'FINISHED pulling from' $1
    echo '>>>>> Repositories not pulled:' ${failures[*]}    
}

# Pulling the Python repositories
export PYTHON_SOURCE_CODE=~/workspace
git_pull_rebase_subdirectories $PYTHON_SOURCE_CODE

echo -e "\n"

# Pulling the Go repositories
export GO_SOURCE_CODE=~/workspace/go/src/github.com/aleasoluciones/
git_pull_rebase_subdirectories $GO_SOURCE_CODE

echo 'FINISHED SUCCESSFULLY'