Get-ChildItem -LiteralPath $env:WinDir -Recurse -Filter '*.txt'
# Get-ChildItem -LiteralPath $env:WinDir -Recurse | Where-Object {$_.Name -eq "no_wildcards_here"}
