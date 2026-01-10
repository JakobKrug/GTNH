# GTNH PROGRESS SYNC GUIDE

## PRISM LAUNCHER CONFIGURATION
Configure these in Instance Settings > Custom Commands:

Pre-launch command:
`git pull origin main`

Post-exit command:
`bash $INST_DIR/post_game.sh`

---

## MULTI-ACCOUNT AND UUID HANDLING
Visual Prospecting uses UUID-based folders (e.g., .minecraft/visualprospecting/client/<UUID>/).
The gitignore uses wildcard patterns (**/) to ensure that regardless of which Microsoft account 
is logged in, the data inside the UUID folder is tracked and synced.

---

## CONFLICT RESOLUTION (LINUX/MACOS)
Create a file named recovery.sh in the instance folder, run 'chmod +x recovery.sh', and use:

```bash
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
```

---

## CONFLICT RESOLUTION (WINDOWS)
Create a file named recovery.bat in the instance folder and use:

```bash
@echo off
echo ------------------------------------------
echo GTNH GIT RECOVERY TOOL (WINDOWS)
echo ------------------------------------------
echo 1) DOWNLOAD FROM GITHUB (Overwrite local map with cloud)
echo 2) UPLOAD TO GITHUB (Overwrite cloud with local map)
echo 3) CANCEL
echo ------------------------------------------
set /p choice="Select an option [1-3]: "

if "%choice%"=="1" (
    git fetch --all
    git reset --hard origin/main
    echo Done. Local matches GitHub.
) else if "%choice%"=="2" (
    git add .
    git commit -m "Manual Force Push Recovery"
    git push origin main --force
    echo Done. GitHub matches Local.
) else if "%choice%"=="3" (
    exit
)
pause
```
