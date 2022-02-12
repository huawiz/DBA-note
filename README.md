這邊存放PowerShell的相關筆記


## Oh-my-posh

[https://ohmyposh.dev/](https://ohmyposh.dev/)

WIN install
```PowerShell
Install-Module oh-my-posh -Scope CurrentUser
Update-Module oh-my-posh 
```


MacOS install
```PowerShell
brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh
```

$profile
```PowerShell
Import-Module posh-git
Import-Module oh-my-posh
oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/tonybaloney.omp.json | Invoke-Expression
```
