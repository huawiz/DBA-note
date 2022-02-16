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

