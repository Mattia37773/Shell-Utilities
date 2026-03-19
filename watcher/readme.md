# Filesystem Watcher

A lightweight, dependency-free shell script designed to monitor your project folders and automatically trigger actions (like builds or tests) whenever a file changes.

---

## What it does
* **Real-time Monitoring**: Watches multiple directories (e.g., `src`, `core`, `config`) for any activity.
* **Event Detection**: Automatically identifies if a file was **Created**, **Modified**, or **Deleted**.
* **Automated Execution**: Runs a custom `run_action` (like your build or internal scripts) the moment a change is saved.
* **Smart Logic**: It passes the name of the changed file to your action so you know exactly what triggered the process.
* **Loop Protection**: Automatically ignores changes made by the build process itself to prevent "infinite build loops."
* **Cross-Platform**: Works out of the box on **Linux** and **macOS**.

---

## 1. Configuration
Open the script and adjust the variables in the **CONFIGURATION** section at the top:

```bash
# Directories to monitor
WATCH_DIRS=("config" "core" "src")

# Files to ignore (e.g., logs or temp files) using Regex
IGNORE_PATTERN="\.tmp$|\.log$"

# How often to check for changes (in seconds)
SLEEP_INTERVAL=1
```
## Set Actions
Place your build commands or script sources inside the run_action() function. The variable $1 (or $changed_file) tells you which file triggered the run:
```bash
run_action() {
    local changed_file="$1"
    
    # YOUR COMMANDS HERE
    ./compile.sh
    echo "$changed_file"
}
```