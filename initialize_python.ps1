# Function to log messages
function Write-Message {
    param([string]$message)
    Write-Host "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] $message"
}

# Function to check if a command exists
function Test-Command {
    param([string]$command)
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'
    try {
        if (Get-Command $command) { return $true }
    } catch {
        return $false
    } finally {
        $ErrorActionPreference = $oldPreference
    }
}

# Check if Python is installed and get its version
Write-Message "Checking Python installation..."
if (Test-Command "python") {
    $pythonVersion = (python --version 2>&1).ToString()
    Write-Message "Python is installed. Version: $pythonVersion"
} else {
    Write-Message "Python is not installed. Please install Python and run this script again."
    exit 1
}

# Check if virtualenv is installed, if not install it
Write-Message "Checking virtualenv installation..."
if (-not (pip list | Select-String -Pattern "^virtualenv\s+")) {
    Write-Message "virtualenv is not installed. Installing virtualenv..."
    pip install virtualenv
    if ($LASTEXITCODE -ne 0) {
        Write-Message "Failed to install virtualenv. Please check your internet connection and try again."
        exit 1
    }
    Write-Message "virtualenv installed successfully."
} else {
    Write-Message "virtualenv is already installed."
}

# Get available Python versions
$pythonVersions = @()
Get-Command python* | ForEach-Object {
    $version = & $_.Name --version 2>&1
    if ($version -match "Python (\d+\.\d+\.\d+)") {
        $pythonVersions += $Matches[1]
    }
}

# Prompt user to select Python version for virtualenv
Write-Message "Available Python versions:"
for ($i = 0; $i -lt $pythonVersions.Count; $i++) {
    Write-Host "$($i + 1). $($pythonVersions[$i])"
}

do {
    $selection = Read-Host "Select the Python version to use for virtualenv (1-$($pythonVersions.Count))"
    $selection = $selection -as [int]
} while ($selection -lt 1 -or $selection -gt $pythonVersions.Count)

$selectedVersion = $pythonVersions[$selection - 1]
Write-Message "Selected Python version: $selectedVersion"

# Create virtualenv
$venvName = ".venv"
Write-Message "Creating virtualenv '$venvName' with Python $selectedVersion..."
python -m virtualenv -p "python$selectedVersion" $venvName
if ($LASTEXITCODE -ne 0) {
    Write-Message "Failed to create virtualenv. Please check your Python installation and try again."
    exit 1
}
Write-Message "Virtualenv created successfully."

# Activate virtualenv
Write-Message "Activating virtualenv..."
$activateScript = Join-Path $venvName "Scripts\Activate.ps1"
if (Test-Path $activateScript) {
    & $activateScript
    Write-Message "Virtualenv activated."
} else {
    Write-Message "Failed to find activation script. Virtualenv may not be set up correctly."
    exit 1
}

# Create main.py and __init__.py
Write-Message "Creating main.py and __init__.py..."
$mainPyContent = @"
#!/usr/bin/env python
# -*- coding: utf-8 -*-

def main():
    print("Hello from main.py!")

if __name__ == "__main__":
    main()
"@

Set-Content -Path "main.py" -Value $mainPyContent
New-Item -ItemType File -Path "__init__.py" -Force | Out-Null

Write-Message "main.py and __init__.py created successfully."
Write-Message "Setup complete. You can now start working on your Python project."
