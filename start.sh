#!/bin/bash

/usr/bin/stunnel /etc/stunnel/stunnel.conf -d
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start stunnel: $status"
  exit $status
fi

/usr/local/nginx/sbin/nginx -g "daemon off;"
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start nginx: $status"
  exit $status
fi

while sleep 60; do
  ps aux |grep stunnel |grep -q -v grep
  STUNNEL_STATUS=$?
  ps aux |grep nginx |grep -q -v grep
  NGINX_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $STUNNEL_STATUS -ne 0 -o $NGINX_STATUS -ne 0 ]; then
    echo "One of the processes has exited."
    exit 1
  fi
done