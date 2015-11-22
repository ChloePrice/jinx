#/bin/bash

#1:directory, 2:prefix
rename(){
  for file in $(ls $1)
  do
    cp "$file" ${$file#!2}
  done
  read -r -p "[JINX] - 'Kay, can I shoot all your fucking useless files now?" response
  if [[ $response =~ ^([nN])$ ]]; then
    echo "[JINX] - Shit! Do it fucking alone!"
    jinx sound taunt
  else
    echo "[JINX] - Haha! Start shooting faster!"
    jinx sound atttack
  fi
}

jinxRenameHelp(){
  echo "Delete prefix arg2 from all filenames in folder arg1"
}
