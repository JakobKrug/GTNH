# GTNH PROGRESS SYNC GUIDE

## PRISM LAUNCHER CONFIGURATION
Configure these in Instance Settings > Custom Commands:

Pre-launch command:
`git pull origin main`

Post-exit command:
Linux:
`bash $INST_DIR/post_game.sh`
Windows:
`bash $INST_DIR\post_game.bat`

---

## CONFLICT RESOLUTION (LINUX/MACOS)
Run conflict.sh in a terminal 

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
