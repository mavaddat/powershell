. .\Get-ADEntry

Clear-Host
$searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]'')
 
While (!$user) {
    $UserName = $env:USERNAME 
    Write-Host "Current user: $UserName"
    if (!$UserName) {
        $UserName = Read-Host "Username" 
    }
    $user=Get-ADEntry -UserName $UserName
} 

Write-Host $user.Path

$D = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$Domain = [ADSI]"LDAP://$D"

# $oldPassword = $(Read-Host -Prompt "Old Password" -AsSecureString)
$newPassword = $(Read-Host -Prompt "Provide New Password" -AsSecureString)

$Domain.SetPassword($newPassword);

Write-Host "Ready"