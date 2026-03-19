# Bash Color Toolkit

A simple, lightweight collection of shell functions to add high-visibility colors to your terminal scripts using `tput`.

---

## What it does
* **Predefined Colors**: Provides easy-to-use functions for Green, Dark Blue, Purple, and Light Blue.
* **Universal Colorizer**: Includes a flexible `colorize` function that accepts any 256-color code.
* **Automatic Reset**: Every function automatically resets the terminal formatting (`sgr0`) so your following text doesn't stay colored.
* **Standardized Output**: Ensures consistent UI feedback across different shell scripts.

---

## How to use it

### 1. Direct Function Calls
Use the specific color functions for quick outputs:

```bash
color_green "Success: Operation completed."
color_purple "Note: This is a custom highlight."
color_lightblue "Info: System is idling..."