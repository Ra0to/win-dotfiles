$utilsFolderName = ".project-utils"

function Find-ProjectUtilsDirectory($path) {
    if ($null -eq $path) {
        return $null
    }

    if ($path -eq "") {
        return $null
    }

    $testPath = "$path\$utilsFolderName"
    if (Test-Path $testPath) {
        return $testPath
    }

    Find-ProjectUtilsDirectory (Split-Path $path)
}

function Run-ProjectUtil {
    $projectUtilsDir = Find-ProjectUtilsDirectory (Get-Location)

    if ($null -eq $projectUtilsDir) {
        Write-Error "Project utils not found"
        return
    }

    if ($args.Count -gt 1) {
        Write-Error "Invalid arguments. pu should be used without arguments or with the script name"
        return
    }

    $files = Get-ChildItem -Path $projectUtilsDir -Recurse | Where-Object { !$_.PSIsContainer }
    if ($files.Count -eq 0) {
        Write-Error "No scripts found in the project utils directory"
        return
    }

    $selectedFileName = $null

    if ($args.Count -eq 1) {
        $selectedFileName = $args[0]
    }
    else {
        $fileSelection = $files | ForEach-Object {
            $fileName = $_.BaseName
            $firstLine = Get-Content $_.FullName -TotalCount 1
            $fileName + " " + $firstLine
        } | Out-String

        $selectedFile = $fileSelection | fzf
        if ($null -ne $selectedFile) {
            $selectedFileName = $selectedFile.Split(" ")[0]
        }
    }

    # No files selected
    if ($null -eq $selectedFileName) {
        return
    }
    
    $selectedFilePath = $files | Where-Object { $_.BaseName -eq $selectedFileName } | Select-Object -ExpandProperty FullName
    
    if ($null -eq $selectedFilePath) {
        Write-Error "No script found with name $selectedFileName"
        return
    }

    Write-Host "Running task '$selectedFileName' located at: $selectedFilePath"
    Write-Host;
    & $selectedFilePath
}

New-Alias -ErrorAction SilentlyContinue -Name pu -Value Run-ProjectUtil