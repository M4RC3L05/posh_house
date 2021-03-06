Remove-Item alias:* -Force

Set-Alias cls Clear-Host -Option AllScope
Set-Alias cd Set-Location -Option AllScope
# Set-Alias chdir Set-Location -Option AllScope
Set-Alias % ForEach-Object -Option AllScope
Set-Alias ? Where-Object -Option AllScope
# Set-Alias iex Invoke-Expression -Option AllScope

# function innerLS {
#     Param ([string]$Path)
#     Get-ChildItem -Path $Path | Select-Object Mode, Name, LastWriteTime, @{Name = "Length"; Expression = {
#             if ((Get-Item $_.FullName) -is [System.IO.DirectoryInfo]) {
#                 return ""
#             }

#             Format-FileSize -Size $_.Length
#         }
#     }
# }

# Set-Alias ls innerLS -Option AllScope

function dk {
    Set-Location "${HOME}/Desktop"
}

function man {
    tldr.cmd -t ocean $args
}

function fsize {
    param(
        # Path of directory/file
        [string]
        $Path
    )

    $totalSize = 0

    if (!(Test-Path -Path $Path)) {
        Write-Output "Not a valid directory or file."
        return;
    }

    if ((Get-Item $Path) -is [System.IO.DirectoryInfo]) {
        $totalSize = (Get-ChildItem -Recurse $Path | Measure-Object -Property Length -Sum).Sum
    }
    elseif ((Get-Item $Path) -is [System.IO.FileInfo]) {
        $totalSize = (Get-Item $Path).Length
    }
    else {
        Write-Output "Not a valid directory or file."
        return;
    }

    $formated = Format-FileSize -Size $totalSize

    Write-Output $formated
}

function trash {
    Remove-ItemSafely $args
}

# function touch() {
#     param(
#         # Path of directory/file
#         [string[]]
#         $Files
#     )

#     $splited = $Files -split ","

#     $splited | ForEach-Object {
#         if ($_.Trim().Length -le 0) {
#             return;
#         }

#         New-Item -ItemType File -Name $_.Trim()
#     }
# }
