#!/bin/bash
set -e

FLAG_FILE="/var/listmonk/first-run-complete.flag"
LISTMONK_PATH="/listmonk/listmonk"

echo "Check if it's the first run by checking the existence of the flag file"

# Check if it's the first run by checking the existence of the flag file
if [ ! -f "$FLAG_FILE" ]; then
    echo "First time run, setting up Listmonk."
    # Mark this as not the first run for future restarts
    $LISTMONK_PATH --install && $LISTMONK_PATH
else
    echo "Restart detected, starting Listmonk normally."
    $LISTMONK_PATH
fi
