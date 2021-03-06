Import-Module ActiveDirectory

$name = Read-Host "Username"

# 1. Retrieve the user in question:
$User = Get-ADUser $name -Properties memberOf

# 2. Retrieve groups that the user is a member of
$Groups = $User.memberOf | ForEach-Object {
    Get-ADGroup $_
} 

# 3. Go through the groups and remove the user
$Groups | ForEach-Object { Remove-ADGroupMember -Identity $_ -Members $User }