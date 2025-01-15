# Get-Help
`get-help get-childitem`

# Everyday PowerShell stuff
## Human-readable file size
```
Start-Process powershell -Verb runAs # su

PS C:\Users\Public\Documents> (Get-Item .\list.csv).Length
654466
PS C:\Users\Public\Documents> (Get-Item .\list.csv).Length / 1MB
0.624147415161133
PS C:\Users\Public\Documents> Get-Item .\list.csv | Select-Object Length

Length
------
654466
```
## Disable ALT-Tab in browser multitasking option
```
$RegPath = "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$Name = "MultiTaskingAltTabFilter"
$Value = 3
Set-ItemProperty -Path $RegPath -Name $Name -Value $Value
```
# Hyper-V and PowerShell

## Broken Hyper-V checkpoints
```
cd C:\ProgramData\Microsoft\Windows\Virtual Hard Disks\
Test-VHD ".\New Virtual Machine.vhdx"
Test-VHD ".\New Virtual Machine_1337718A-1337-1337-1337-45D50BBE1337.avhdx"
Test-VHD: Failed to validate the disk information.
[...]
Set-VHD -Path '.\New Virtual Machine_1337718A-1337-1337-1337-45D50BBE1337.avhdx' -ParentPath '.\New Virtual Machine.vhdx'
Set-VHD: Failed to set new parent for the virtual disk.
There exists ID mismatch between the differencing virtual hard disk and the parent disk.
Set-VHD -Path <child.vhdx> -ParentPath  <parent.vhdx> -IgnoreIdMismatch
```

## Hyper-V copy&paste
Copy&Paste (requires RDP group membership on guest system): Integration Services - Guest Services
```
Get-LocalUser
Get-LocalGroup | Format-List
Get-LocalGroup | Out-GridView # opens window for output
Get-LocalGroup | Select-String -Pattern "Remote"
Get-LocalGroupMember -Group 'Remote Desktop Users'
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "hypervguestuser"

$rdsMembers = @(
'host\user',
'host\anotheruser'
)

Add-LocalGroupMember -Group 'Remote Desktop Users' -Member $rdsMembers
```
# User and group management

```
Get-LocalGroupMember -Group "Hyper-V Administrators"
Add-LocalGroupMember -Group "Hyper-V Administrators" -Member "NT AUTHORITY\Local account"
Add-LocalGroupMember -Group "Hyper-V Administrators" -Member "italy"
Get-LocalUser | Select-Object * | Out-GridView
```


# ssh
Elevated shell to start ssh-agent: `Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service`
`$env:USERPROFILE\.ssh\config` must be UTF-8. Check using notepad++ (bottom right corner) and change via Encoding manu.

# Git
Git config adjustments (yes, these are forward slashes):
```
winget install Git.Git
git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe
git config --global user.email "you@example.com"
git config --global user.name "you"
```

# Vim
Perhaps you wish to avoid weird Windows-isms: `start notepad++ .\README.md`
Create `C:\Users\YOUR_USER_NAME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1` and edit:
```
# NOTE: different locations for .ps1 profile files
$VIMPATH = $SCRIPTPATH + "C:\Program Files\Vim\vim91\vim.exe"
Set-Alias vim $VIMPATH
cd C:\Users\your_user\git_repos
ssh-add C:\Users\your_user\.ssh\id_ed25519
```
Don't forget to adjust execution policy and verify: `Set-ExecutionPolicy -Executionpolicy RemoteSigned -Scope Currentuser`, `Get-ExecutionPolicy -List`

# Make your browser tell you how to use Invoke-WebRequest
In your browser: F12 - Network tab - open a website - right-click a line with a HTTP status code (usually 200) - there should be a copy as PowerShell option.

# Setting and displaying environment variables
`set` for current console only, `setx` for all consoles. Show all environment variables using `dir env:`
```
> set MY_VAR var_value
> $Env:MY_VAR
var_value
```

# Keyboard shortcut to open PowerShell as there's no easy CTRL+ALT+T
`Win+X` followed by `i` or `A` for elevated privileges.

# Move on PowerShell command line
`home` (`pos1`) and `end` move the cursor. Additional `SHIFT` highlights, `CTRL` would delete.

(from here: notes from "PowerShell for Systems Engineers" book)
# What is splatting in PowerShell?
Splatting allows you to pass a set of parameter values to a command as a single hashtable or dictionary.

```
$params = @{
    Name = "John Doe"
    DisplayName = "John Doe"
    EmailAddress = "johndoe@example.com"
    Path = "OU=ExampleOrg,OU=ExampleEntityType,DC=exampledc,DC=org"
    AccountPassword = (ConvertTo-SecureString "password" -AsPlainText -force)
}

New-ADUser @params
```

# Commands of interest in no specific order
```
Set-WinUILanguageOverride -Language en-US

Update-Help -Verbose -Force -ErrorAction SilentlyContinue -ErrorVariable UpdateErrors
Get-Help Get-ChildItem
Get-Help Get-ChildItem -Online # opens website

Write-Host "Hello" # cat equivalent

Get-Module 
Get-InstalledModule # will access %userprofile%\Documents\WindowsPowerShell

Install-Module ActiveDirectory # admin privileges; triggers NuGet requirement
```

