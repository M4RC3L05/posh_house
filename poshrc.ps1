. "$PSScriptRoot\posh_alias.ps1"
. "$PSScriptRoot\posh_functions\git\gitHelpers.ps1"
. "$PSScriptRoot\posh_functions\path\pathHelpers.ps1"
. "$PSScriptRoot\posh_functions\os\osHelpers.ps1"
. "$PSScriptRoot\posh_functions\ssh\sshHelpers.ps1"

Import-Module posh-git
Import-Module PSReadLine
Import-Module "$PSScriptRoot\posh_themes\ThemeProvider.psm1"

$GitPromptSettings.EnableFileStatus = $false

# SSH-AGENT AUTOSTART
$agent = SshAgent-Get
if ($agent -eq 0) {
    SshAgent-Start
}

Set-Theme -themeName "future"
