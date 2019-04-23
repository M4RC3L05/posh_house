function Theme {

    param(
        [Parameter(Mandatory = $true)]
        [bool]
        $exitStatus
    )

    $successCmd = [char]::ConvertFromUtf32(0x00002714)
    $adminSign = [char]::ConvertFromUtf32(0x000026a1)
    $errorCmd = [char]::ConvertFromUtf32(0x00002573)
    $arrowSign = [char]::ConvertFromUtf32(0x0000276F)
    $gitSign = [char]::ConvertFromUtf32(0x0000f418)
    $repoDirtySign = [char]::ConvertFromUtf32(0x000000b1);
    $prompt = ""

    if (isAdmin) {
        $prompt += Write-Host "$adminSign " -ForegroundColor ([ConsoleColor]::Yellow)
    }

    if (!$exitStatus) {
        $prompt += Write-Prompt "$errorCmd " -ForegroundColor ([ConsoleColor]::Red)
    }
    else {
        $prompt += Write-Prompt "$successCmd " -ForegroundColor ([ConsoleColor]::Green)
    }

    $prompt += Write-Prompt (& pathLikeFish) -ForegroundColor ([ConsoleColor]::Blue)

    if (Get-GitStatus) {
        [string]$gitDir = $(Get-GitDirectory)
        [string]$currBranch = $(Get-GitBranch -gitDir $gitDir)

        if ($currBranch.Length -gt 0) {

            $prompt += Write-Prompt " git:$gitSign" -ForegroundColor ([ConsoleColor]::White)

            if (("" + $(git status -s)).Length -gt 0) {
                $prompt += Write-Prompt " $currBranch$repoDirtySign" -ForegroundColor ([ConsoleColor]::Yellow)
            }
            else {
                $prompt += Write-Prompt " $currBranch" -ForegroundColor ([ConsoleColor]::Green)
            }
        }
        else {
            $prompt += Write-Prompt "" -ForegroundColor ([ConsoleColor]::White)
        }
    }

    $prompt += Write-Prompt " $arrowSign" -ForegroundColor ([ConsoleColor]::Red)
    $prompt += Write-Prompt "$arrowSign" -ForegroundColor ([ConsoleColor]::Yellow)
    $prompt += Write-Prompt "$arrowSign" -ForegroundColor ([ConsoleColor]::Magenta)
    $prompt += " "
    $prompt
}
