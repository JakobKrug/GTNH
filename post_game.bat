@echo off
cd ..
git add .
git commit -m "Auto-sync: %DATE% %TIME%"
git push origin main
pause