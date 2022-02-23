這邊存放PowerShell的相關筆記



## 可以使PS1檔案停止秀畫面的方法

[link](https://www.delftstack.com/howto/powershell/powershell-press-any-key-to-continue/#:~:text=Use%20timeout%20to%20Enable%20the%20press%20any%20key,%2Ft%20option%20to%20specify%20the%20time%20in%20seconds.)

The cmd /c pause command displays the Press any key to continue . . . and pause the execution until a key is pressed.

```PowerShell
cmd /c pause
```

Output:
```
Press any key to continue . . .
```

## Oh-my-posh

[https://ohmyposh.dev/](https://ohmyposh.dev/)

WIN install
```PowerShell
Install-Module oh-my-posh -Scope CurrentUser
Update-Module oh-my-posh 
```


MacOS install
```zsh
brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh
```

$profile
```PowerShell
Import-Module posh-git
Import-Module oh-my-posh
oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/tonybaloney.omp.json | Invoke-Expression
```
