Remove-Item alias:* -Force

Set-Alias cls Clear-Host -Option AllScope
Set-Alias cd Set-Location -Option AllScope

function dk {
    Set-Location "${HOME}/Desktop"
}

function man {
    tldr -t ocean $args
}

function ls {
    C:\Users\joaob\scoop\shims\ls.exe --color=always $args
}

function mkdir {
    C:\Users\joaob\scoop\shims\mkdir.exe $args
}

function fsize {
    C:\Users\joaob\scoop\shims\du.exe -hcs $args
}


# ----------------------
# Git Aliases
# ----------------------
function g {
    git $args
}

function ga {
    g add $args
}

function gaa {
    git add .
}

function gaaa {
    git add --all $args
}

function gau {
    git add --update $args
}

function gb {
    git branch $args
}

function gbd {
    git branch --delete $args
}

function gc {
    git commit $args
}

function gco {
    git checkout $args
}

function gd {
    git diff $args
}

function ginit {
    git init $args
}

function glg {
    git log --graph --oneline --decorate --all $args
}

function gm {
    git merge $args
}

function gp {
    git pull $args
}

function gpr {
    git pull --rebase $args
}

function gr {
    git rebase $args
}

function gs {
    git status $args
}

function gss {
    git status --short $args
}

function gst {
    git stash $args
}

function gsta {
    git stash apply $args
}

function gstd {
    git stash drop $args
}

function gstl {
    git stash list $args
}

function gstp {
    git stash pop $args
}

function gsts {
    git stash save $args
}

function gpush {
    git push $args
}
