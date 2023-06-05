#!/bin/bash

echo "****** We are in: $(pwd)"
repos=`pwd`
branch=$1

IFS=$'\n'

for repo in `ls "$repos/"`
do
  if [ -d "$repos/$repo" ]
  then
    if [ -d "$repos/$repo/.git" ]
    then
      echo ">> Entering to '$repo/'..."
      cd "$repos/$repo"
      #git status
      echo ">>>> Switching to '$branch' branch"
      git checkout $branch
      echo ">>>> Fetching..."
      git fetch
      echo ">>>> Pulling..."
      git pull -r
    else
      echo ">> Skipping '$repo/' because it doesn't look like it has a .git folder."
    fi
    echo
    echo
  fi
done
echo "End at: `date`"
