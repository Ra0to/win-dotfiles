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
    glog --first-parent -n 15 $args
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

function Alias-CreatePR {
    $base_branch = "stable"
    $head_reference = "HEAD -> "
    $head_reference_pattern = "$head_reference*"
    $current_commit_references = $(git show --format="%D" --no-patch HEAD) -split ', '

    foreach($reference in $current_commit_references) {
        if ($reference -like $head_reference_pattern) {
            $current_branch = $reference -replace $head_reference
        }
    }

    if (!$current_branch) {
        Write-Error "No references found on current commit, request can't be created. Are you in the detached HEAD state?"
        exit 1
    }

    $remotes = $(git remote show -n) -split '\n'
    $github_remote_pattern = "https://github.com/*"
    foreach($remote in $remotes) {
        $remote_link = $(git remote get-url $remote)
        if ($remote_link -like $github_remote_pattern) {
            $link = $remote_link -replace "\.git"
        }
    }

    if (!$link) {
        Write-Error "Can't find suitable remote. Currently only GitHub requests are supported"
        Exit 1
    }

    git push;
    Start-Process "$link/compare/$base_branch...$current_branch"
}

# Use force because gpr already exists in the psgit plugin (for `git pull rebase`)
New-Alias -Force -Name gpr -Value Alias-CreatePR

function Select-Branch {
    $raw_branch = $(git branch | fzf)
    $current_branch_prefix = "\* "
    $branch = $raw_branch -replace $current_branch_prefix -replace "  "
    return $branch;
}

function Alias-SelectBranch {
    $branch = Select-Branch
    if (!$branch) {
        return;
    }
    git switch $branch
}

New-Alias -ErrorAction SilentlyContinue -Name gbsl -Value Alias-SelectBranch

function Alias-DeleteSelectedBranch {
    $branch = Select-Branch
    if (!$branch) {
        return;
    }
    git branch -d $branch
}

New-Alias -ErrorAction SilentlyContinue -Name gbdsl -Value Alias-DeleteSelectedBranch

function Alias-ForceDeleteSelectedBranch {
    $branch = Select-Branch
    if (!$branch) {
        return;
    }
    git branch -D $branch
}

New-Alias -ErrorAction SilentlyContinue -Name gbdsl! -Value Alias-ForceDeleteSelectedBranch

# TODO fix duplication with psgit
Function Alias-discard {
  git clean -fd;
  git restore $(git rev-parse --show-toplevel);
}
New-Alias -ErrorAction SilentlyContinue -Name gdis -Value Alias-discard

Function Alias-SwitchStable {
  git switch stable;
}
New-Alias -ErrorAction SilentlyContinue -Name gsws -Value Alias-SwitchStable

Function Alias-SwitchOriginStable {
  git branch -D stable;
  git fetch --all;
  git switch stable;
}
New-Alias -ErrorAction SilentlyContinue -Name gswos -Value Alias-SwitchOriginStable

Function Alias-MergeStable {
  git merge stable;
}
New-Alias -ErrorAction SilentlyContinue -Name gms -Value Alias-MergeStable

Function Alias-MergeOriginStable {
  git fetch --all;
  git merge origin/stable;
}
New-Alias -ErrorAction SilentlyContinue -Name gmos -Value Alias-MergeOriginStable

Function Alias-RebaseStable {
  git rebase stable;
}
New-Alias -ErrorAction SilentlyContinue -Name grbs -Value Alias-RebaseStable

Function Alias-RebaseOriginStable {
  git fetch --all;
  git rebase origin/stable;
}
New-Alias -ErrorAction SilentlyContinue -Name grbos -Value Alias-RebaseOriginStable
