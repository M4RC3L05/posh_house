Function Format-FileSize() {
    Param ([int]$size)
    If ($size -gt 1TB) { [string]::Format("{0:0.00} Tb", $size / 1TB) }
    ElseIf ($size -gt 1GB) { [string]::Format("{0:0.00} Gb", $size / 1GB) }
    ElseIf ($size -gt 1MB) { [string]::Format("{0:0.00} Mb", $size / 1MB) }
    ElseIf ($size -gt 1KB) { [string]::Format("{0:0.00} Kb", $size / 1KB) }
    ElseIf ($size -gt 0) { [string]::Format("{0:0.00} b", $size) }
    Else { "" }
}
