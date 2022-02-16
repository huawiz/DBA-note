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