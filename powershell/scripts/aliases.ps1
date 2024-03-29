New-Alias -ErrorAction SilentlyContinue -Name l -Value Get-ChildItem

function Alias-RemoveFolder {
    Remove-Item -Recurse -Force $args
}

New-Alias -ErrorAction SilentlyContinue -Name rmrf -Value Alias-RemoveFolder

function Alias-ChangeDirectoryToTheParent {
    Set-Location ..
}

New-Alias -ErrorAction SilentlyContinue -Name .. -Value Alias-ChangeDirectoryToTheParent

function Alias-ChangeDirectoryToTheParentOfParent {
    Set-Location ../..
}

New-Alias -ErrorAction SilentlyContinue -Name ... -Value Alias-ChangeDirectoryToTheParentOfParent

function Alias-ChangeDirectoryToTheThirdParent {
    Set-Location ../../..
}

New-Alias -ErrorAction SilentlyContinue -Name .... -Value Alias-ChangeDirectoryToTheThirdParent

function Alias-StartNeoVim {
    nvim -u $HOME/.configs/nvim/init.lua $ARGS
}

New-Alias -ErrorAction SilentlyContinue -Name v -Value Alias-StartNeoVim
New-Alias -ErrorAction SilentlyContinue -Name vim -Value Alias-StartNeoVim

function Alias-SelectItemFromHistory {
    $command = $(bat $env:APPDATA\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt | Sort-Object | Get-Unique | fzf)
    if (!$command) {
        return
    }

    Invoke-Expression $command
}

New-Alias -ErrorAction SilentlyContinue -Name his -Value Alias-SelectItemFromHistory
