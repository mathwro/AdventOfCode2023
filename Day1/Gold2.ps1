[CmdletBinding()]
param (
  [Parameter()][String]$InputFile = "$PsScriptRoot/input2.txt"
)

$numberTable = @{
  "one"   = 1
  "two"   = 2
  "three" = 3
  "four"  = 4
  "five"  = 5
  "six"   = 6
  "seven" = 7
  "eight" = 8
  "nine"  = 9
}

$numTable = [string[]]$numberTable.Keys

# Source function
. $PsScriptRoot/functions/GetCalibrationValue.ps1



$inputf = Get-Content $InputFile
$final = $null
ForEach ($line in $inputf) {
  $tmpLine = $line
  $numTable | ForEach-Object {
    if ($tmpLine -match $_) {
      $tmpLine -match $_ | Out-Null
      $tmpLine = $tmpLine.Replace($_, $numberTable[$Matches.Values])
    }
  }
  $result = Get-CalibrationValue $tmpLine
  $final = $final + $result
}
Write-Host $final