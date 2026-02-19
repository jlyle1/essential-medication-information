#!/bin/bash
publisher_jar=publisher.jar
input_cache_path=./input-cache

echo "Checking internet connection..."
if ping -c 1 tx.fhir.org &> /dev/null; then
  echo "We're online"
  txoption=""
else
  echo "We're offline..."
  txoption="-tx n/a"
fi

export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

if [ -f "$input_cache_path/$publisher_jar" ]; then
  java -jar "$input_cache_path/$publisher_jar" -ig . $txoption "$@"
elif [ -f "../$publisher_jar" ]; then
  java -jar "../$publisher_jar" -ig . $txoption "$@"
else
  echo "IG Publisher NOT FOUND in input-cache or parent folder. Please run _updatePublisher. Aborting..."
fi
