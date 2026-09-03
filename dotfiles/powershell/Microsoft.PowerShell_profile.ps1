
#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

Set-PSReadlineKeyHandler -Key Tab -Function Complete

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias -Name cd -Value z -Option AllScope
