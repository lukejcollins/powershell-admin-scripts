# Import Active Directory Module
Import-Module ActiveDirectory

# Get group name from user input
$groupName = Read-Host -Prompt 'Enter part of the Group name'

# Get groups that match the user input
$groups = Get-ADGroup -Filter "Name -like '*$groupName*'" 

$exportData = foreach ($group in $groups) {

    Write-Host "Processing group: $($group.Name)"

    # Get all the users from the group
    $groupMembers = Get-ADGroupMember -Identity $group -Recursive | Where-Object {$_.objectClass -eq 'user'}

    $userCount = $groupMembers.Count
    $currentUser = 1

    # Loop through the users and export the desired data
    foreach ($user in $groupMembers) {
        Write-Host "`tProcessing user ${currentUser} of ${userCount}: $($user.SamAccountName)"
        $userData = Get-ADUser -Identity $user.SamAccountName -Properties Enabled

        [PSCustomObject] @{
            GroupName = $group.Name
            Username  = $userData.SamAccountName
            Name      = $userData.Name
            Enabled   = $userData.Enabled
        }

        $currentUser++
    }
}

# Define the path relative to the script's location
$csvPath = Join-Path -Path $PSScriptRoot -ChildPath 'export.csv'

# Export the data to CSV
$exportData | Export-Csv -Path $csvPath -NoTypeInformation

Write-Host "Export completed. The CSV file is located at: $csvPath"
