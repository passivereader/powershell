# Get-Help
`get-help`
# ssh-agent
Elevated shell: `Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service`
Git config adjustments (yes, these are forward slashes): `git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe`

# Vim
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

