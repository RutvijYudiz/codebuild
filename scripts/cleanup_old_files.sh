#!/bin/bash
# Remove existing files in the destination directory to avoid conflicts
if [ -d /var/www/html ]; then
  echo "Cleaning up old files..."
  rm -rf /var/www/html/*
fi