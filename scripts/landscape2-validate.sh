#!/bin/bash

TARGET_KIND=$1
TARGET_PATH=$2

function printUsage() {
    echo "USAGE: landscape-validate.sh <TARGET_KIND> <TARGET_PATH>"
    echo -e "\TARGET_KIND options: data, games, guide or settings"
    exit 1
}

if [ -z "$TARGET_KIND" ] || [ -z "$TARGET_PATH" ]; then
    printUsage
fi

case $TARGET_KIND in
  data)
    landscape validate data --data-file $TARGET_PATH
    ;;
  games)
    landscape validate games --games-file $TARGET_PATH
    ;;
  guide)
    landscape validate guide --guide-file $TARGET_PATH
    ;;
  settings)
    landscape validate settings --settings-file $TARGET_PATH
    ;;
  *)
    printUsage
    ;;
esac
