function goHome {
    Set-Location  "${HOME}/Desktop"
}

function callMan {
    & "C:\Users\joaob\scoop\apps\nodejs-lts\current\bin\tldr.cmd" -t ocean $args
}

Remove-Item alias:* -Force

Set-Alias cd Set-Location -Option AllScope
Set-Alias cls Clear-Host -Option AllScope
Set-Alias dk goHome -Option AllScope
Set-Alias man callMan -Option AllScope
Set-Alias ls "C:\Users\joaob\scoop\shims\ls.exe" -Option AllScope
