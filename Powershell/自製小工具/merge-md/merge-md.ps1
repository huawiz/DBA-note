# `merge-md -path "." -outfile "./outfile.md"`
function merge-md{
    Param(
        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string]$inPath,

        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string]$outfile
    )

    Process{
        if((test-path -Path $inPath) -ne $true){
            throw [InvalidArgumentException]::new("InPath could not be found.")
         }

        if((test-path -Path $out) -ne $true){
            write-verbose "Creating $outPath"
            New-Item -path $outPath -ItemType Directory | out-null
        }
    }
    #讀取.md檔案
    $files = Get-ChildItem -path $inPath -filter *.md 

    foreach($file in $files){
        Write-Verbose "Processing $($file.FullName)"

         $content = _process -file $file.FullName

         $finalFile = Join-Path -Path $OutPath -ChildPath $file.Name

         Write-Verbose "Writing $finalFile"
         Set-Content -Path $finalFile -Value $content -Force
    }
}

function _process {
    [CmdletBinding()]
    param(
       [System.IO.FileInfo] $file
    )
 
    process {
       $r = [regex]'<!\-\-\s#include\s"([^"]+)"\s\-\->'
       $content = Get-Content -Path $file.FullName -Raw
 
       if ($null -ne $content) {
          $m = $r.Matches($content)
 
          while ($m.Count) {
             $includedFile = $m.Groups[1]
 
             # Regardless if it is relative or absolute this will fix the path
             $includedFile = [System.IO.Path]::GetFullPath((Join-Path $file.Directory $includedFile))
 
             Write-Verbose "Processing included file $includedFile"
             $newContent = _process -file $includedFile
 
             $content = $content.Replace($m.Groups[0], $newContent)
 
             $m = $r.Matches($content)
          }
       }
 
       return $content
    }
 }