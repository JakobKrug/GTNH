# GTNH PROGRESS SYNC GUIDE

## PRISM LAUNCHER CONFIGURATION
Configure these in Instance Settings > Custom Commands:

Pre-launch command:
`git pull origin main`

Post-exit command:
`git add . && git diff-index --quiet HEAD || (git commit -m "Auto-sync: $(date)" && git push origin main)`

---

## REPOSITORY STRUCTURE (.gitignore)
```bash
# Block everything by default
*
.*

# Launcher Metadata
!.gitignore
!gtnh_icon.png

# Directory Climbing
!/.minecraft/
.minecraft/*

# Data Whitelist
!/.minecraft/journeymap/
!/.minecraft/visualprospecting/
!/.minecraft/TCNodeTracker/
!/.minecraft/journeymap/**
!/.minecraft/visualprospecting/**
!/.minecraft/TCNodeTracker/**

# Configs and Settings
!/.minecraft/knownkeys.txt
!/.minecraft/localconfig.cfg
!/.minecraft/options.txt
!/.minecraft/optionsnf.txt
!/.minecraft/servers.dat
!/.minecraft/config/visualprospecting.cfg
!/.minecraft/shaderpacks/*.txt

# Exclusions
.minecraft/journeymap/data/sp/
.minecraft/journeymap/icon/
.minecraft/journeymap/theme/
.minecraft/journeymap/webmap/
.minecraft/journeymap/colorpalette.*
.minecraft/logs/
.minecraft/backups/
*.log
```

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
