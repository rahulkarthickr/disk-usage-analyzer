#!/bin/bash

################################

# Author : Rahul
# Date : 11 Aug 2024
# Purpose : Disk Usage Analyzer

################################

function display_disk_usage {
    echo "Disk Usage Report:"
    df -h /
}

function list_largest_files {
    local directory="$1"
    echo "Listing largest files in the directory: $directory"
    du -ah "$directory" 2>/dev/null | sort -rh | head -n 10
}

function check_inode_usage {
    echo "Inode Usage Report:"
    df -i /
}

function main_menu {
    echo "Disk Usage Analyzer Menu"
    echo "1. Display Disk Usage of Root Directory"
    echo "2. List Largest Files in the Target Directory"
    echo "3. Check Inode Usage"
    echo "4. Exit"
    
    read -p "Enter your choice(1-4): " choice
    
    case $choice in
      1) display_disk_usage ;;
      2) read -p "Enter directory path: " dir_path
         list_largest_files "$dir_path" ;;
      3) check_inode_usage ;;
      4) echo "Exiting , Goodbye!"
         exit ;;
      *) echo "Invaild choice. Please enter a number from 1 to 4."
         main_menu ;;
    esac
}

while true; do
    main_menu
done
