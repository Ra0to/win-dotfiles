function Install-Last {
    $searchDirectory = "$HOME/Downloads";
    $buildFilesPattern = "*.apk";
    $lastBuild = (
        Get-ChildItem -Path $searchDirectory -File -Filter $buildFilesPattern |
        Sort-Object -Property LastWriteTime |
        Select-Object -Last 1
    ).FullName;
    Write-Host "Installing:";
    Write-Host $lastBuild;
    adb install -r $lastBuild;
}

function Run-Bundletool {
    java -jar 'C:\Program Files\Android\Tools\bundletool-all-1.15.4.jar' $args
}

New-Alias -ErrorAction SilentlyContinue -Name bundletool -Value Run-Bundletool

function Install {
    adb install -r $args;
}

New-Alias -ErrorAction SilentlyContinue -Name install -Value Install