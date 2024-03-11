# ssh-agent
Elevated shell: `Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service`
Git config adjustments (yes, these are forward slashes): `git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe`

# Vim
Create `C:\Users\YOUR_USER_NAME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1` and edit:
```# NOTE: different locations for .ps1 profile files
$VIMPATH = $SCRIPTPATH + "C:\Program Files\Vim\vim91\vim.exe"
Set-Alias vim $VIMPATH
cd C:\Users\your_user\git_repos
ssh-add C:\Users\your_user\.ssh\id_ed25519
```
Don't forget to adjust execution policy and verify: `Set-ExecutionPolicy -Executionpolicy RemoteSigned -Scope Currentuser`, `Get-ExecutionPolicy -List`

# Make your browser tell you how to use Invoke-WebRequest
In your browser: F12 - Network tab - open a website - right-click a line with a HTTP status code (usually 200) - there should be a copy as PowerShell option.

# Setting environment variables
`set` for current console only, `setx` for all consoles

# Keyboard shortcut to open PowerShell as there's no easy CTRL+ALT+T
`Win+X` followed by `i` or `A` for elevated priviliges.
