#!/bin/bash

BACKUP_SRC="/path/to/source"
BACKUP_DEST="/path/to/backup"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

tar -czf $BACKUP_DEST/$BACKUP_NAME $BACKUP_SRC

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_NAME"
else
    echo "Backup failed"
fi
