. "$PSScriptRoot\posh_alias.ps1"
Import-Module "$PSScriptRoot\posh_functions\git\gitHelpers.ps1"
Import-Module "$PSScriptRoot\posh_functions\path\pathHelpers.ps1"
Import-Module "$PSScriptRoot\posh_functions\os\osHelpers.ps1"
Import-Module "$PSScriptRoot\posh_functions\ssh\sshHelpers.ps1"
Import-Module "$PSScriptRoot\posh_themes\themes\future\future.theme.ps1"


# SSH-AGENT AUTOSTART
$agent = Get-SshAgent
if ($agent -eq 0) {
    Start-SshAgent
}

function prompt {
    Theme
}
