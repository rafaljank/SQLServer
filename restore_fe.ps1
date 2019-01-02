$mykey='BUVImFlBBkWoKna3kUnIyplWI9UUQd/Fo5jx0tJnucq1YTLJBWB47+NdG9r9hqhtorPqBt/jDysc1xHh8Elw8w==';
$azcopypath='"c:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy\AzCopy.exe"';
$source='https://t1r1.file.core.windows.net/dbs01/FE/';
$dest='E:\tmp'
try{
 Get-PSDrive -Name Z -ErrorAction stop
 }
 catch{
 $acctKey = ConvertTo-SecureString -String "BUVImFlBBkWoKna3kUnIyplWI9UUQd/Fo5jx0tJnucq1YTLJBWB47+NdG9r9hqhtorPqBt/jDysc1xHh8Elw8w==" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList "Azure\t1r1", $acctKey
New-PSDrive -Name Z -PSProvider FileSystem -Root "\\t1r1.file.core.windows.net\dbs01" -Credential $credential -Persist
 }
$lastdiff=(ls z:/fe/DBS-CLUSTER*AG_FE_FlightEngine_DIFF* | Sort-Object -Descending {$_.LastWriteTime})[0]
$lastfull=(ls z:/fe/DBS-CLUSTER*AG_FE_FlightEngine_FULL* | Sort-Object -Descending {$_.LastWriteTime})[0]
if ($lastdiff.LastWriteTime -gt $lastfull.LastAccessTime){
 $azcopycmd=[string]::Format("{0} /source:{1} /dest:{2} /sourcekey:{3} /y /Pattern:{4}",$azcopypath, $source, $dest, $mykey, $lastdiff.Name);
 cmd /c $azcopycmd
 $s1="$dest\"+$lastdiff.name
 $s2="$dest\"+"FEDiff.bak"
 Remove-Item $s2 -Force
 Rename-Item -Path $s1 -NewName $s2 -Force
 Invoke-Sqlcmd -InputFile C:\Users\r.jank\scripts\fe_restore_fulldiff.sql -Username "r.jank" -Password  "MiF6Y-r_sc52" -QueryTimeout 65500 -OutputSqlErrors 1 -Verbose 4>&1 | Out-File C:\Users\r.jank\logs\FE_restore_log.txt -Append
}
else {
$azcopycmd=[string]::Format("{0} /source:{1} /dest:{2} /sourcekey:{3} /y /Pattern:{4}",$azcopypath, $source, $dest, $mykey, $lastfull.Name);
 cmd /c $azcopycmd
 $s1="$dest\"+$lastfull.name
 $s2="$dest\"+"FEfull.bak"
 Remove-Item $s2 -Force
 Rename-Item -Path $s1 -NewName $s2 -Force
 Invoke-Sqlcmd -InputFile C:\Users\r.jank\scripts\fe_restore_full.sql -Username "r.jank" -Password  "MiF6Y-r_sc52" -QueryTimeout 65500 -OutputSqlErrors 1 -Verbose 4>&1 | Out-File C:\Users\r.jank\logs\FE_restore_log.txt -Append

}

