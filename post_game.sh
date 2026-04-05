#!/bin/bash
git add .
git add -f .minecraft/blueprints/
git add -f .minecraft/config/dsurround/dsurround.cfg
git add -f .minecraft/config/Waila.cfg
git add -f .minecraft/config/WailaHarvestability.cfg
git add -f .minecraft/config/lwjgl3ify.cfg
git add -f .minecraft/journeymap/data/
git add -f .minecraft/resourcepacks/
git add -f .minecraft/saves/NEI/global/
git add -f .minecraft/schematics/
git add -f .minecraft/screenshots/
git add -f .minecraft/shaderpacks/
git add -f .minecraft/TCNodeTracker/
git add -f .minecraft/texturepacks/
git add -f .minecraft/visualprospecting/
git commit -m "Auto-sync: $(date)"
git push origin main
