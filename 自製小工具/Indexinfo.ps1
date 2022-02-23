
#header
$header = "DB","Schema","Table" ,"Index","index-id","type-desc","avg fragmentation in percent","IndexSize(MB)","Update","Seek","Scan","Lookups","last seek","last scan","last lookup"


#load file
$log = import-csv -Delimiter `t ` -Header $header -Path "C:\Users\Justin\Desktop\doc\Log\*IndexInfo*.log"

#sort by time and group by source
#$log | ft -GroupBy Sec | ft -GroupBy Third -wrap | out-gridview
$log | Out-GridView -Title 'Indexinfo'

#cmd /c pause
