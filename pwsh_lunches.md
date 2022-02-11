# Powershell.md

## Ch2

`$PSVersionTable` 查看Powershell的版本

## Ch3 Get Help

`update-help` 更新最新的說明文件

`help *command*` 列出關於command的cmdlet,function,說明文件

`get-help *command*` 載入command的說明文件

`Get-Command -Verb write -Noun EventLog` 獲得動詞寫入EventLog的指令

注意:可以用TAB鍵來選擇字，減少打字錯誤的機會。

## Ch4 執行命令

1. Powershell是一種shell語言。

2. Powershell 代碼規則是 `cmdlet_name --參數1 值1 --參數2 值2 --參數3`

3. Cmdlet有命名慣例，一般都是使用`verb-功能`形式呈現。

4. 可使用alias指令來取得指令別名
   -  `get-alias`  取得別名
   -  `Export-Alias` 輸出別名清單
   -  `Import-Alias` 輸入別名清單
   -  `New-Alias` 自訂別名

5. `$name` 是參數名稱