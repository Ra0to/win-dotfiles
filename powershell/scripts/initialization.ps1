$local:PluginsPath = "$PSScriptRoot/../plugins";

# FIX args params for tab completion with aliases.
# See: https://github.com/dahlbyk/posh-git/issues/852#issuecomment-816158370
Import-Module "$PluginsPath/posh-git/src/posh-git.psd1" -arg 0,0,1

. "$PluginsPath/psgit/git.plugin.ps1" -Force
. "$PSScriptRoot/androidUtils.ps1"
. "$PSScriptRoot/aliases.ps1"
. "$PSScriptRoot/gitAliases.ps1"
. "$PSScriptRoot/keyBindings.ps1"
. "$PSScriptRoot/config.ps1"
. "$PSScriptRoot/initializeZoxide.ps1"
