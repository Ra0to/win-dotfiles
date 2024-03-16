# PoshGit

$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
$GitPromptSettings.DefaultPromptSuffix = " > "

$GitPromptSettings.DefaultPromptPath = '$(Get-ShortPrompt)'
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 0xC678DD

function Get-ShortPrompt {
    $CurrentPath = $PWD.ToString();
    if ($CurrentPath.Length -eq $HOME.Length -and $CurrentPath.Contains($HOME)) {
        return "~"
    }

    return Split-Path $PWD -Leaf
}

