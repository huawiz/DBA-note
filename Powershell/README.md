這邊存放PowerShell的相關筆記

## 自學技巧
這裡再複習一次如何自~救~學

想知道pwsh有沒有xxx功能
1. 先用`get-help`查詢看看
2. 發現沒有，那用`get-command`看看
3. 還是沒有，那去[PowerShell Gallery](http://powershellgallery.com)查查看有沒有人開發相關的套件
4. 有了!使用`install-module`來安裝Plugin
5. 在google之前，先搜尋看看作者有沒有寫相關說明文件
6. 又學了一招，good

## 防止ps1檔案秒退的方法

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
