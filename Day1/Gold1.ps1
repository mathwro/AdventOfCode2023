[CmdletBinding()]
param (
    [Parameter()][String]$InputFile = "$PsScriptRoot/input1.txt"
)

# Source function
. $PsScriptRoot/functions/GetCalibrationValue.ps1

$final = $null
$tst = Get-Content -Path $InputFile
$tst | ForEach-Object { 
  $result = Get-CalibrationValue $_
  $final = $final + $result
}
Write-Host $final