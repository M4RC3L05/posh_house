function LoadTheme ($themeName) {
    $finalPath = "$PSScriptRoot\themes\$themeName\$themeName.theme.ps1"

    if (![System.IO.File]::Exists($finalPath)) {
        return "PS $(Get-Location)> "
    }

    . $finalPath

    Theme
}
