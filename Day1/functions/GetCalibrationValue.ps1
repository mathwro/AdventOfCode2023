function Get-CalibrationValue {
  param (
    $line
  )
  $m = ($line | Select-String -Pattern '\d' -AllMatches).Matches.Value
  $n = $m[0] + $m[-1]
  return [int]$n
}