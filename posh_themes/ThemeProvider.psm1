function Set-Prompt {
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $themePath
    )

    $global:errCount = $global:error.Count

    Import-Module $themePath

    [scriptblock]$Prompt = {
        $exitCodeStatus = $global:error.Count -eq $global:errCount
        $global:errCount = $global:error.Count

        # $Host.UI.RawUI.ForegroundColor = "White"
        # Write-Host -NoNewline "$([char]0x200B)"

        Theme -exitStatus $exitCodeStatus
    }

    Set-Item -Path Function:prompt -Value $Prompt -Force
}

function Set-Theme {
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $themeName
    )

    $finalPath = "$PSScriptRoot\themes\$themeName\$themeName.theme.psm1"

    if (![System.IO.File]::Exists($finalPath)) {
        Write-Warning "The theme $themeName doesen't exist.`nAvailable Themes:"

        Get-Themes

        return
    }

    return Set-Prompt -themePath $finalPath
}

function Get-Themes {

    [System.Linq.Enumerable]::OrderBy(
        [System.IO.DirectoryInfo]::new("$PSScriptRoot\themes\").GetDirectories(),
        [Func[System.IO.DirectoryInfo, string]] {
            param(
                [System.IO.DirectoryInfo]
                $dir
            )

            return $dir
        }) | ForEach-Object {$i = 1} {
        Write-Host "#$i - $_"

        $i += 1
    }

    Write-Host ""
}

$Exports = @{
    Function = @(
        "Set-Theme",
        "Get-Themes"
    )
}

Export-ModuleMember @Exports
