#!/bin/bash
echo "------------------------------------------"
echo "GTNH GIT RECOVERY TOOL (LINUX/MAC)"
echo "------------------------------------------"
echo "1) DOWNLOAD FROM GITHUB (Overwrite local map with cloud)"
echo "2) UPLOAD TO GITHUB (Overwrite cloud with local map)"
echo "3) CANCEL"
echo "------------------------------------------"
read -p "Select an option [1-3]: " choice
case $choice in
    1)
        git fetch --all
        git reset --hard origin/main
        echo "Done. Local matches GitHub."
        ;;
    2)
        git add .
        git commit -m "Manual Force Push Recovery"
        git push origin main --force
        echo "Done. GitHub matches Local."
        ;;
    3)
        exit 0
        ;;
esac
