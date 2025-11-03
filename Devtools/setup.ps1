# PowerShell setup script for development environment

# Get the git root directory
$GIT_ROOT = git rev-parse --show-toplevel 2>$null

# If git_root is empty, fall back to the current directory
if ([string]::IsNullOrEmpty($GIT_ROOT)) {
    $GIT_ROOT = Get-Location
}

Write-Host "Setting up development environment in $GIT_ROOT"

# Change to git root directory
Set-Location $GIT_ROOT

# Check if virtual environment exists
if (-not (Test-Path ".venv")) {
    Write-Host "Creating virtual environment..."
    python -m venv .venv
}

# Activate virtual environment
Write-Host "Activating virtual environment..."
& ".\.venv\Scripts\Activate.ps1"

# Install requirements
Write-Host "Installing requirements..."
pip install -r requirements.txt

Write-Host "Setup complete!"
