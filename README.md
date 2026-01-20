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
Run the conflict script while inside the root of the Repo.
