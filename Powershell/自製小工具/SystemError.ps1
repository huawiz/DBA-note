
#header
$header = "EventID" ,"Time","Source","Message"


#load file
$log = import-csv -Delimiter `t ` -Header $header -Path "C:\Users\Justin\Desktop\doc\Log\*SystemError*.log"

#sort by time and group by source
#$log | sort time | ft -GroupBy source -autosize -wrap | out-default
$log | Out-GridView -title 'SystemError'

#cmd /c pause

