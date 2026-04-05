# GTNH PROGRESS SYNC GUIDE

## Setup
1. Create a new Instance in Prism Launcher.
2. Clone the Repository into a seperate Folder.
3. Move all Files in the cloned Folder over the Instace Folder, so that both .minecraft Folders merge.
4. Run the Conflict Script and Select Download from GitHub.

## PRISM LAUNCHER CONFIGURATION
Configure these in Instance Settings > Custom Commands:

Pre-launch command:
`git pull origin main`

Post-exit command:
Linux:
`bash "$INST_DIR/post_game.sh"`
Windows:
`bash "$INST_DIR\post_game.bat"`
