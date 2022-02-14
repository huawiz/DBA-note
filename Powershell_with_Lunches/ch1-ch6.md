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

ech
## Ch5 Provider

Provider(提供者)是指轉接器(adapter)，其設計就是把某些資料按照分類儲存，並使它看起來像磁碟機。

例如`Get-PSProvider` 

![Image](https://i.imgur.com/upy3xo5.png)

`FileSystem` 指的就是最熟悉的C槽，它就是一種Provider。

`Get-PSProvider` 查看Provider

`Get-PSDrive` 查看現有的Provider

## Ch6 串接指令

我們可以使用`|`來串接指令。例如

`GET-PROCESS | EXPORT-CSV PROCESS.CSV`把GET-PROCESS得到的表格以csv檔案匯出。

`Diff -referenceobject (Export-clixml reference.xml) -differenceobject (get-process) -property name` 抓xml進來和get-process依照name作比較

- 輸出有很多形式，一般pwsh預設是印出來

   即 `dir` = `dir | out-defalt`

- 可以透過`>`來指定輸出位子，例如`dir > test.txt`，就可以把dir列出的表格印成`test.txt`

- 可以透過CONVERT+OUTPUT指令，組成組合指令，把資料轉換成想要的格式檔案，例如
   `get-process | convertTo-html | out-file test.html`

- 可以使用`DIFF`指令來比較兩個檔案差異，例如
   `Diff -referenceobject (Export-clixml reference.xml) -differenceobject (get-process) -property name` 抓xml進來和get-process依照name作比較