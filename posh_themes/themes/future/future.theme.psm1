function Theme {

    param(
        [Parameter(Mandatory = $true)]
        [bool]
        $exitStatus
    )

    $adminSign = [char]::ConvertFromUtf32(0x000026a1)
    $errorSign = [char]::ConvertFromUtf32(0x00002716)
    $repoDirtySign = [char]::ConvertFromUtf32(0x000000b1);
    $prompt = ""

    if (isAdmin) {
        $prompt += Write-Prompt ("$adminSign ") -ForegroundColor ([ConsoleColor]::Yellow)
    }

    if (!$exitStatus) {
        $prompt += Write-Prompt ("$errorSign ") -ForegroundColor ([ConsoleColor]::Red)
    }

    $prompt += Write-Prompt ($(pathLikeFish)) -ForegroundColor ([ConsoleColor]::Blue)

    if (git__isRepo) {
        [string]$gitDir = $(Get-GitDirectory)
        [string]$currBranch = $(Get-GitBranch -gitDir $gitDir)

        if ($currBranch.Length -gt 0) {
            if (("" + $(git status -s)).Length -gt 0) {
                $prompt += Write-Prompt " ($currBranch $repoDirtySign)" -ForegroundColor ([ConsoleColor]::Yellow)
            }
            else {
                $prompt += Write-Prompt " ($currBranch)" -ForegroundColor ([ConsoleColor]::Green)
            }
        }
        else {
            $prompt += Write-Prompt "" -ForegroundColor ([ConsoleColor]::White)
        }
    }

    $prompt += Write-Prompt "`n$" -ForegroundColor ([ConsoleColor]::White)
    $prompt += " "
    $prompt
}
