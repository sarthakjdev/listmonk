#!/bin/bash
set -e

FLAG_FILE="/var/listmonk/first-run-complete.flag"
LISTMONK_PATH="/listmonk/listmonk"

$LISTMONK_PATH --install &&  $LISTMONK_PATH
