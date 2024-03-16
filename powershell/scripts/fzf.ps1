# FZF settings

$env:FZF_DEFAULT_COMMAND = "fd --type file"
$env:FZF_DEFAULT_OPTS = "--layout=reverse --inline-info --height 25%"

function Alias-fzfAll {
    fd --unrestricted | fzf
}

New-Alias -ErrorAction SilentlyContinue -Name fzfa -Value Alias-fzfAll
