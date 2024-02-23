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