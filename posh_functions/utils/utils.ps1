Function Format-FileSize() {
    Param ($Size)

    if ($Size -gt 1TB) { [string]::Format("{0:0.00} Tb", $Size / 1TB) }
    elseif ($Size -gt 1GB) { [string]::Format("{0:0.00} Gb", $Size / 1GB) }
    elseif ($Size -gt 1MB) { [string]::Format("{0:0.00} Mb", $Size / 1MB) }
    elseif ($Size -gt 1KB) { [string]::Format("{0:0.00} Kb", $Size / 1KB) }
    elseif ($Size -gt 0) { [string]::Format("{0:0.00} b", $Size) }
    else { "" }
}
