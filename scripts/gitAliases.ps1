function Alias-GitBranchList {
    git branch --list
}

New-Alias -ErrorAction SilentlyContinue -Name gbls -Value Alias-GitBranchList

function Alias-GitBranchListAll {
    git branch --list --all
}

New-Alias -ErrorAction SilentlyContinue -Name gblsa -Value Alias-GitBranchListAll


function Alias-GitBranchListRemote {
    git branch --list --remote
}

New-Alias -ErrorAction SilentlyContinue -Name gblsr -Value Alias-GitBranchListRemote

function Alias-GitReview {
    git fetch --all;
    $branch = $args[0];
    git switch --detach origin/$branch;
    if (!$?)
    {
        Write-Host -ForegroundColor Red "Can't start review. Error occurred!";
        return;
    } 
    Write-Host -NoNewLine "Reviewing branch: ";
    Write-Host -ForegroundColor Green "$branch";
}

New-Alias -ErrorAction SilentlyContinue -Name greview -Value Alias-GitReview

function Alias-GitLogFirsParent {
    glog --first-parent $args
}

New-Alias -ErrorAction SilentlyContinue -Name glogfp -Value Alias-GitLogFirsParent

function Alias-LogTopCommits {
    glog --first-parent -n 10 $args
}

New-Alias -ErrorAction SilentlyContinue -Name gtop -Value Alias-LogTopCommits

function Alias-AddCsFiles {
    git add *.cs*;
}

New-Alias -ErrorAction SilentlyContinue -Name gacs -Value Alias-AddCsFiles

function Alias-WhatDidIDo {
    $base = git merge-base HEAD origin/develop;
    if (!$?)
    {
        return;
    }
    glog --first-parent HEAD ^$base~1
}

New-Alias -ErrorAction SilentlyContinue -Name gwdid -Value Alias-WhatDidIDo

function Alias-CommitTestEnvironment {
    git commit --all -m "DROP configurate test environment"
}

New-Alias -ErrorAction SilentlyContinue -Name gtenv -Value Alias-CommitTestEnvironment