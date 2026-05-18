## 🔹 Shell Script — Backup Directory
#!/bin/bash
SOURCE= "var/log"
DEST="/backup/pathnex-$(date +%F).tar.gz"

tar -czf $DEST $SOURCE
echo "Backup created at: $DEST"