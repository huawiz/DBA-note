
#標頭
$header = "EventID" ,"Time","Source","Message"


#載入資料
$log = import-csv -Delimiter `t ` -Header $header -Path "./Dynapack_WJ80_SystemError_20220217.log"

#依照Source排序
$log | sort time | ft -GroupBy source -autosize -wrap | out-default


cmd /c pause

