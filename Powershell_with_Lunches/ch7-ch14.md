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

