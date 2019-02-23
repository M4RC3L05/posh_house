Import-Module Get-ChildItemColor

function goHome {
    Set-Location  "${HOME}/Desktop"
}

function ManTLDR {
    tldr -t ocean $args
}

Set-Alias dk goHome
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
Set-Alias man ManTLDR -option AllScope
