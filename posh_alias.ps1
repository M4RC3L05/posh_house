# Remove-Item alias:* -Force

# Set-Alias cls Clear-Host -Option AllScope
# Set-Alias cd Set-Location -Option AllScope
# Set-Alias chdir Set-Location -Option AllScope
# Set-Alias % ForEach-Object -Option AllScope
# Set-Alias ? Where-Object -Option AllScope
# Set-Alias iex Invoke-Expression -Option AllScope

function dk {
    Set-Location "${HOME}/Desktop"
}

function man {
    tldr.cmd -t ocean $args
}

function ls {
    ls.exe --color=always $args
}

# function mkdir {
#     mkdir.exe $args
# }

function fsize {
    du.exe -hcs $args
}

function trash {
    Remove-ItemSafely $args
}
