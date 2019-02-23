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