function Theme {

    param(
        [Parameter(Mandatory = $true)]
        [bool]
        $exitStatus
    )

    $adminSign = [char]::ConvertFromUtf32(0x000026a1)
    $errorSign = [char]::ConvertFromUtf32(0x00002573)
    $repoDirtySign = [char]::ConvertFromUtf32(0x000000b1);
    $animalsArr = @(
        [char]::ConvertFromUtf32(0x0001f63a),
        [char]::ConvertFromUtf32(0x0001f435),
        [char]::ConvertFromUtf32(0x0001f436),
        [char]::ConvertFromUtf32(0x0001f43a),
        [char]::ConvertFromUtf32(0x0001f981),
        [char]::ConvertFromUtf32(0x0001f42f),
        [char]::ConvertFromUtf32(0x0001f992),
        [char]::ConvertFromUtf32(0x0001f98a),
        [char]::ConvertFromUtf32(0x0001f99d),
        [char]::ConvertFromUtf32(0x0001f42e),
        [char]::ConvertFromUtf32(0x0001f437),
        [char]::ConvertFromUtf32(0x0001f417),
        [char]::ConvertFromUtf32(0x0001f42d),
        [char]::ConvertFromUtf32(0x0001f439),
        [char]::ConvertFromUtf32(0x0001f430),
        [char]::ConvertFromUtf32(0x0001f43b),
        [char]::ConvertFromUtf32(0x0001f428),
        [char]::ConvertFromUtf32(0x0001f43c),
        [char]::ConvertFromUtf32(0x0001f438))

    $prompt = ""

    if (isAdmin) {
        $prompt += Write-Prompt ("$adminSign ") -ForegroundColor ([ConsoleColor]::Yellow)
    }

    if (!$exitStatus) {
        $prompt += Write-Prompt ("$errorSign ") -ForegroundColor ([ConsoleColor]::Red)
    }

    $emoj = $animalsArr[(Get-Random -Maximum ($animalsArr).Count)]
    $prompt += Write-Prompt ("$emoj ")

    $prompt += Write-Prompt ($(pathLikeFish)) -ForegroundColor ([ConsoleColor]::Blue)

    if (Get-GitStatus) {
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
