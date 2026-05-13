## 🔹 Shell Script — Check CPU Load
#!/bin/bash

LOAD = $(uptime | awk '{print $10}')
echo "Current CPU Load: $LOAD"