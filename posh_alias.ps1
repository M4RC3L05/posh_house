Remove-Item alias:* -Force

Set-Alias cls Clear-Host -Option AllScope
Set-Alias cd Set-Location -Option AllScope
Set-Alias chdir Set-Location -Option AllScope
Set-Alias % ForEach-Object -Option AllScope
Set-Alias ? Where-Object -Option AllScope
Set-Alias iex Invoke-Expression -Option AllScope

function dk {
    Set-Location "${HOME}/Desktop"
}

function man {
    tldr.cmd -t ocean $args
}

function ls {
    ls.exe --color=always $args
}

function mkdir {
    mkdir.exe $args
}

function fsize {
    du.exe -hcs $args
}

function trash {
    Remove-ItemSafely $args
}

# ----------------------
# Git Aliases
# ----------------------
function g {
    git.ps1 $args
}

function ga {
    g add $args
}

function gaa {
    git.ps1 add .
}

function gaaa {
    git.ps1 add --all $args
}

function gau {
    git.ps1 add --update $args
}

function gb {
    git.ps1 branch $args
}

function gbd {
    git.ps1 branch --delete $args
}

function gc {
    git.ps1 commit $args
}

function gco {
    git.ps1 checkout $args
}

function gd {
    git.ps1 diff $args
}

function ginit {
    git.ps1 init $args
}

function glg {
    git.ps1 log --graph --oneline --decorate --all $args
}

function gm {
    git.ps1 merge $args
}

function gp {
    git.ps1 pull $args
}

function gpr {
    git.ps1 pull --rebase $args
}

function gr {
    git.ps1 rebase $args
}

function gs {
    git.ps1 status $args
}

function gss {
    git.ps1 status --short $args
}

function gst {
    git.ps1 stash $args
}

function gsta {
    git.ps1 stash apply $args
}

function gstd {
    git.ps1 stash drop $args
}

function gstl {
    git.ps1 stash list $args
}

function gstp {
    git.ps1 stash pop $args
}

function gsts {
    git.ps1 stash save $args
}

function gpush {
    git.ps1 push $args
}
