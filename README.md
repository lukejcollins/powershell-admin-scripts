# PowerShell Admin Scripts

Welcome to PowerShell Admin Scripts repo! This repository contains a collection of administrative scripts written in PowerShell for managing and maintaining your systems. The scripts in this repository are designed to make administrative tasks easier and more efficient. 

## Script 1: Active Directory Group Export

The first script in this repo allows you to export all the users of specific Active Directory (AD) groups based on a part of the group name that you provide.

This script imports the AD module, gets a list of groups that matches a provided string, retrieves all users for each group, and exports the data to a CSV file.

### What it does

1. Import Active Directory Module: `Import-Module ActiveDirectory`
2. Get group name from user input
3. Fetch groups that match the user input
4. Iterate over each group, and for each group:
    - Display progress
    - Get all users in the group
    - Iterate over the users and for each user:
        - Display progress
        - Fetch user data
        - Prepare data for export
5. Define a path for CSV export relative to the script's location
6. Export data to a CSV file

### How to use

1. Clone this repo.
2. Navigate to the script's directory via PowerShell.
3. Run the script using the command: `.\script_name.ps1`
4. When prompted, enter part of the group name you wish to export users from.
5. The script will process the groups and users, then export the data to a CSV file in the same directory as the script. It will display the path to the CSV file once it's done.

### Note

This script needs the Active Directory PowerShell module to be installed and accessible on the machine where the script is run. Also, the user running the script should have the necessary permissions to read from Active Directory.

## Future Scripts

Keep an eye on this repository for more PowerShell Admin Scripts that will make your administrative tasks easier. Don't hesitate to contribute if you have any scripts that you believe would be helpful to other admins. Happy scripting!
