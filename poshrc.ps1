. "$PSScriptRoot\posh_alias.ps1"
Import-Module "$PSScriptRoot\posh_functions\git\gitHelpers.psm1"
Import-Module "$PSScriptRoot\posh_functions\path\pathHelpers.psm1"
Import-Module "$PSScriptRoot\posh_functions\os\osHelpers.psm1"
Import-Module "$PSScriptRoot\posh_themes\themes\future\future.theme.psm1"

function prompt {
    Theme
}
