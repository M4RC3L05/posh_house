Import-Module Get-ChildItemColor

function goHome {
    Set-Location  "${HOME}/Desktop"
}

Set-Alias dk goHome
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

function git__getCurrBranch {
    return [string]($(git symbolic-ref HEAD) -replace ".+\/.+\/", "")
}

function git__isRepo {
    $res = $(git rev-parse --is-inside-work-tree 2> $null)

    if ($res -eq "true") { return $true } else { return $false }
}

function git__getRepoName {
    $res = (("" + $($(git remote -v) -match "(fetch)")).Split(":")[1]).Replace("(fetch)", "")
    $res = [io.path]::GetFileNameWithoutExtension($res)
    return $res
}

function pathLikeFish {
    $final = ""
    $currPath = ("" + $(Get-Location)).Replace($HOME, "~").Split("\");
    $cursor = 0;

    foreach ($chunk in $currPath) {
        $cursor += 1;
        if ($cursor -eq $currPath.Length) {
            $final += $chunk
        }
        elseif ($chunk -match "^[A-Z]\:$") {
            $final += $chunk
        }
        elseif ($chunk -match "^[^a-zA-Z0-9]") {
            if ($chunk.Length -ge 2) {
                $final += $chunk.Substring(0, 2)
            }
            else {
                $final += $chunk.Substring(0, $chunk.Length)
            }
        }
        else {
            if ($chunk.Length -ge 1) {
                $final += $chunk.Substring(0, 1)
            }
            else {
                $final += $chunk.Substring(0, $chunk.Length)
            }
        }

        if ($cursor -lt $currPath.Length) {
            $final += "\"
        }
    }

    return $final
}

function isAdmin {
    $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $prp = new-object System.Security.Principal.WindowsPrincipal($wid)
    $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
    return [bool]$prp.IsInRole($adm)
}

function prompt {
    $exitCodeStatus = $?

    if (isAdmin) {
        Write-Host "⚡ " -ForegroundColor Yellow -NoNewline
    }

    if ($exitCodeStatus) {

    }
    else {
        Write-Host "╳ " -ForegroundColor Red -NoNewline
    }

    Write-Host ($(pathLikeFish)) -ForegroundColor Blue -NoNewline
    
    if (git__isRepo) {
        $currBranch = $(git__getCurrBranch)
        if ($currBranch.Length -gt 0)  {
            if (("" + $(git status -s)).Length -gt 0) {
                Write-Host -ForegroundColor Yellow (" (${currBranch})")
            }
            else {
                Write-Host -ForegroundColor Green (" (${currBranch})")
            }
        } else {
            Write-Host -ForegroundColor White ""
        }
    }
    else {
        Write-Host -ForegroundColor White ""
    }
    
    Write-Host -ForegroundColor White ("$") -NoNewline

    return " "
}