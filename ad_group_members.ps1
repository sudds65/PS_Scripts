Get-ADGroupMember -identity “ ” | select name,SamAccountName | Export-csv -path C:OutputGroupmembers.csv -NoTypeInformation
