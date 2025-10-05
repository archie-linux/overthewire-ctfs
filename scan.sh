#!/bin/bash

# Check if the hostname and port file were provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <hostname> <port_file>"
  exit 1
fi

# Assign variables
HOST=$1
PORT_FILE=$2

# Check if the file exists
if [ ! -f "$PORT_FILE" ]; then
  echo "File $PORT_FILE not found!"
  exit 1
fi

# Loop through each port in the file
while IFS= read -r PORT; do
  echo "Trying $HOST on port $PORT..."
  # Use nc to attempt connection
  nc -zv "$HOST" "$PORT" 2>&1
done < "$PORT_FILE"

