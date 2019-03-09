. "$PSScriptRoot\posh_alias.ps1"

Import-Module posh-git
Import-Module PSReadLine

. "$PSScriptRoot\posh_functions\git\gitHelpers.ps1"
. "$PSScriptRoot\posh_functions\path\pathHelpers.ps1"
. "$PSScriptRoot\posh_functions\os\osHelpers.ps1"
. "$PSScriptRoot\posh_functions\ssh\sshHelpers.ps1"
. "$PSScriptRoot\posh_themes\themeLoader.ps1"

$GitPromptSettings.EnableFileStatus = $false

# SSH-AGENT AUTOSTART
$agent = Get-SshAgent
if ($agent -eq 0) {
    Start-SshAgent
}

function prompt {
    LoadTheme -themeName "future"
}
