Import-Module activedirectory

$User = Read-Host 'What is the User ID?'

$UN = Get-ADUser $User -Properties MemberOf
$Groups = ForEach ($Group in ($UN.MemberOf))
{  (Get-ADGroup $Group).Name
}
$Groups = $Groups | Sort
ForEach ($Group in $Groups)
{  New-Object PSObject -Property @{
      Name = $UN.Name
      Group = $Group
   }
}