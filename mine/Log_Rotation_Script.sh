#!/bin/bash

LOG_DIR="/var/log/myapp"
MAX_LOGS=7

find $LOG_DIR -type f -name "*.log" | while read LOGFILE; do
    mv "$LOGFILE" "$LOGFILE.1"
    gzip "$LOGFILE.1"
done

find $LOG_DIR -type f -name "*.log.gz" -mtime +$MAX_LOGS -exec rm {} \;
