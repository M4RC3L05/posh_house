
function Theme {
    $exitCodeStatus = $?
    $adminSign = [char]::ConvertFromUtf32(0x26a1)
    $errorSign = [char]::ConvertFromUtf32(0x2716)

    if (isAdmin) {
        Write-Host ("$adminSign ") -ForegroundColor Yellow -NoNewline
    }

    if (!$exitCodeStatus) {
        Write-Host ("$errorSign ") -ForegroundColor Red -NoNewline
    }

    Write-Host ($(pathLikeFish)) -ForegroundColor Blue -NoNewline

    if (git__isRepo) {
        $currBranch = $(git__getCurrBranch)
        if ($currBranch.Length -gt 0) {
            if (("" + $(git status -s)).Length -gt 0) {
                Write-Host -ForegroundColor Yellow (" (${currBranch})")
            }
            else {
                Write-Host -ForegroundColor Green (" (${currBranch})")
            }
        }
        else {
            Write-Host -ForegroundColor White ""
        }
    }
    else {
        Write-Host -ForegroundColor White ""
    }

    Write-Host -ForegroundColor White ("$") -NoNewline

    return " "
}
