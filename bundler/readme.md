# Bash Script Bundler

A simple Bash script to bundle multiple Bash files into a single standalone executable script. It automatically resolves `source` or `.` includes and can optionally include all files in `generated/help/` as pre-includes.

## Features

- Bundles an entry Bash script and all sourced files into a single file.   
- Removes comments for a cleaner final script.  
- Compatible with both GNU/Linux and macOS.  
- Sets executable permissions and adds a proper shebang.  

## Usage

```bash
./bundler.sh <entry_file> [output_file]
```
