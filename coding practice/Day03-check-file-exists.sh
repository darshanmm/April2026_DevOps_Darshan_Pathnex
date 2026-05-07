##Shell script - Check if a file exists
#!/bin/bash
FILE="/tmp/pathnex.txt"
if [ -f "$FILE" ]; then
    echo "File $FILE exists."
else
    echo "File $FILE does not exist."
fi