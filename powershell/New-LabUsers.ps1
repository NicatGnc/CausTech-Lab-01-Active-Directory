# New-LabUsers.ps1

# Creates fictional department user accounts in the CausTech Active Directory lab.

# Run on DC01 in an elevated PowerShell session with the ActiveDirectory module.

Import-Module ActiveDirectory -ErrorAction Stop

$Password = Read-Host "Enter a temporary password for the lab accounts" -AsSecureString

$Users = @(
@{ First = "Sarah";   Last = "Wilson";   Username = "swilson";   OU = "IT";      Group = "IT-Users" },
@{ First = "Emily";   Last = "Brown";    Username = "ebrown";    OU = "HR";      Group = "HR-Users" },
@{ First = "Michael"; Last = "Davis";    Username = "mdavis";    OU = "Finance"; Group = "Finance-Users" },
@{ First = "Daniel";  Last = "Smith";    Username = "dsmith";    OU = "Finance"; Group = "Finance-Users" },
@{ First = "James";   Last = "Taylor";   Username = "jtaylor";   OU = "Sales";   Group = "Sales-Users" },
@{ First = "Olivia";  Last = "Martin";   Username = "omartin";   OU = "Sales";   Group = "Sales-Users" },
@{ First = "Robert";  Last = "Anderson"; Username = "randerson"; OU = "IT";      Group = "IT-Users" },
@{ First = "Sophia";  Last = "Thomas";   Username = "sthomas";   OU = "HR";      Group = "HR-Users" },
@{ First = "William"; Last = "Jackson";  Username = "wjackson";  OU = "Sales";   Group = "Sales-Users" }
)

foreach ($User in $Users) {
$Name = "$($User.First) $($User.Last)"
$UPN = "$($User.Username)@caustech.local"
$Path = "OU=$($User.OU),OU=CausTech Users,DC=caustech,DC=local"

```
if (Get-ADUser -Filter "SamAccountName -eq '$($User.Username)'" -ErrorAction SilentlyContinue) {
    Write-Warning "Skipping existing account: $($User.Username)"
    continue
}

New-ADUser `
    -Name $Name `
    -GivenName $User.First `
    -Surname $User.Last `
    -SamAccountName $User.Username `
    -UserPrincipalName $UPN `
    -Path $Path `
    -AccountPassword $Password `
    -Enabled $true `
    -ChangePasswordAtLogon $true `
    -ErrorAction Stop

Add-ADGroupMember -Identity $User.Group -Members $User.Username -ErrorAction Stop

Write-Host "Created $Name ($($User.Username)) and added to $($User.Group)"
```

}
