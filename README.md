# My config for the windows powershell

## Pre requisites

Install posh-git and Recycle

```powershell
Install-Module -name posh-git
Install-Module -name Recycle
```

then go to your powershel profile file and past has follows

```powershell
# change to the directory you clone, mine is in the home folder
if (Test-Path $home\.posh_house\poshrc.ps1) {
    # import poshrc
    . $home\.posh_house\poshrc.ps1

    # optional
    $GitPromptSettings.EnableFileStatus = $false

    # optional
    Set-PSReadlineOption -BellStyle None

    # sets the current theme (type Get-Themes for a list of available themes)
    Set-Theme -themeName "andros"
}
```
