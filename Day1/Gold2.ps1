[CmdletBinding()]
param (
    [Parameter()][String]$InputFile = "$PsScriptRoot/Input2.txt"
)

$numberTable = @{
  "one" = 1
  "two" = 2
  "three" = 3
  "four" = 4
  "five" = 5
  "six" = 6
  "seven" = 7
  "eight" = 8
  "nine" = 9
}

$input = Get-Content $InputFile
$final = $null
ForEach ($line in $input) {
  $tmpResult = $null
    ($line | Select-String -Pattern $numberTable.keys -AllMatches).Matches.value | ForEach {
      $tmpResult = $tmpResult + $numberTable["$_"]
      Write-Host $tmpResult
    }
    ($line | Select-String -Pattern '\d' -AllMatches).Matches.value | ForEach {
      $tmpResult = $tmpResult + $_
    }
  $lineResult = $tmpResult[0] + $tmpResult[-1]
  Write-Host $lineResult
  $final = [int]$final + [int]$lineResult
}
Write-Host $final