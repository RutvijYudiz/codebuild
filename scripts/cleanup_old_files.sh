#!/bin/bash

# Define the target directory where files will be deployed
TARGET_DIR="/var/www/html"

# Log file for script operations
LOG_FILE="/var/log/codedeploy/cleanup_old_files.log"

# Create the log file directory if it does not exist
mkdir -p $(dirname "$LOG_FILE")

# Function to log messages with timestamp
log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Start script
log_message "Starting cleanup process..."

# Check if target directory exists
if [ -d "$TARGET_DIR" ]; then
    log_message "Target directory $TARGET_DIR exists. Cleaning up old files..."

    # Remove all files and directories in the target directory
    rm -rf "$TARGET_DIR"/*

    # Check if the operation was successful
    if [ $? -eq 0 ]; then
        log_message "Successfully cleaned up old files in $TARGET_DIR."
    else
        log_message "Failed to clean up old files in $TARGET_DIR."
        exit 1
    fi
else
    log_message "Target directory $TARGET_DIR does not exist. No cleanup needed."
fi

# End script
log_message "Cleanup process completed."
