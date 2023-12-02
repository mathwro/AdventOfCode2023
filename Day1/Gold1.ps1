[CmdletBinding()]
param (
    [Parameter()][String]$InputFile = "$PsScriptRoot/Input1.txt"
)

$final = $null
$tst | ForEach { 
  $tStr = $null
  $m = ($_ | Select-String -Pattern '\d' -AllMatches).Matches.Value
  $n = $m[0] + $m[-1]
  $final = $final + [int]$n
}
Write-Host $final