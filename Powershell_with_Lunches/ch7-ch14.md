# ch7 pluggin

`install-module` 安裝

`import-module` 載入模組

`$profile` pwsh開啟時，載入的指令檔案

# ch8 object

## 為何需要objects?
在我們使用get-process時，可能會得到常常一列列表，裡面按照系統預設的表格藍未來顯示，然而事實上這個指令能擷取的東西還很多，但是有時我們可能只是想要從其中一欄來找資料，那這時候我們就需要一個能溝通方式，那就是物件，來取得我們要的屬性。

排序 `sort -property name -desc`

選擇 `select -property name,xxID`

取得物件`get-member` or `gm`


# CH9 Object deep
在匯入csv檔案時，可能會有物件名稱無法對應的問題。

這時我們可以一個技巧來讓錯誤的csv屬性名稱對應到正確的屬性名稱

`'@{name='Name';expression=$_.error_name}`


例如今天import csv

![Image](https://i.imgur.com/7XJEyoT.png)

我就可以使用這招來改

![Image](https://i.imgur.com/htfd0ha.png)




今天我只想從error_name抓下資料，那有兩種做法

1. `foreach {$_.error_name}`

2. `select -expandproperty error_name`

![Image](https://i.imgur.com/hkIrYiZ.png)


# ch10 格式化輸出

`Formate-table` 可以用來讓顯示畫面更美觀，例如使用`-wrap`和`-autosize`。

一開始預設是這樣，文字會被...省略，而且畫面沒有配合視窗

![Image](https://i.imgur.com/77NQjwR.png)

再來加入 `-autosize`

![Image](https://i.imgur.com/fajgZO7.png)

最後再加入`-wrap`，各列顯示內容換完全顯示。

![Image](https://i.imgur.com/ilL58d7.png)


使用`-groupby`會使屬性變動時被分隔

![Image](https://i.imgur.com/RHfzaPn.png)

另外還有`fl --> formate-list` 和 `fw --> formate-wide`


# ch11 篩選與比較

1. 任何get-開頭的cmdlet，都能使用filter，但是不建議直接搜尋 -filter *，如果叢集過大，會加劇伺服器負擔。

把要搜尋的項目放左邊，然後搜尋要的文字樣子

例如: `Get-ADComputer -filter "Name -filter '*DC'"`

可以使用`where --> where-object`

例如 `get-process --> where propertyname -eq 'vscode'`

2. 比較運算

`-eq` =

`-ne` !=

`ge` >= `le` <=

`gt` > `lt`<

`-ceq,-cne...` 可忽略大小寫，比較字串

`-and` & `-or` |

`-like` 可接受*字元

`-match`字串與規則做比較

詳細可看`about_comparison_operators`

3. filter 

搜尋特定格式的資料，例如`Get-Service | where status -eq 'running'`

這只適用於簡單的情況，要複雜一點，還是需要`{}`和`$_`

例如:`get-service | Where-Object -filter {$_.Status -eq 'running' -and  $_.DisplayName -like '*Network*'}`

他會先運行`get-service`然後把結果丟給`where-object`進行filter:保留status = running 和 diplayname 包含 network的項目。

# ch12 實際案例
這裡再複習一次如何自~救~學

想知道pwsh有沒有xxx功能
1. 先用`get-help`查詢看看
2. 發現沒有，那用`get-command`看看
3. 還是沒有，那去[PowerShell Gallery](http://powershellgallery.com)查查看有沒有人開發相關的套件
4. 有了!使用`install-module`來安裝Plugin
5. 在google之前，先搜尋看看作者有沒有寫相關說明文件
6. 又學了一招，good



# ch13 遠端控制

需要連同一個AD、在同一個區域網路下

1. `Enter-PSSession -computername` 遠端操控電腦


2. `Exit-PSSession` 離開


3. ` Invoke-Command` 可以直接對遠端電腦下指令

    例如` Invoke-Command -ComputerName server1 -FilePath C:\Indexinfo.ps1 | ConvertTo-Html | Out-File test.html`
    
    從Server1撈資料-->運行Indexinfo.ps1-->轉成html-->存成test.html

4. 可以使用`get-adcomputer -filter * | select -expand name`來獲取電腦清單，接著拿來用組合技

    例如:`Invoke-Command -command {get-process} -ComputerName (Get-ADComputer -filter * | select -expand name)`

    獲取ad computer list --> 全部執行get-process


    
