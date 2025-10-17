# PowerShell Theme Example
# This file demonstrates how the themes highlight PowerShell syntax

# Variables
$userName = "John Doe"
$userAge = 30
$userEmail = 'john.doe@example.com'

# Comments are highlighted in green (dark themes) or green (light theme)

# Functions and Cmdlets
function Get-UserInfo {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Name,
        
        [Parameter(Mandatory=$false)]
        [int]$Age = 0
    )
    
    # String interpolation
    Write-Host "User: $Name, Age: $Age"
    
    # Operators
    if ($Age -gt 18 -and $Age -lt 65) {
        Write-Output "Working age"
    }
    elseif ($Age -ge 65) {
        Write-Output "Retirement age"
    }
    else {
        Write-Output "Youth"
    }
}

# Calling cmdlets
Get-Process | Where-Object { $_.CPU -gt 100 } | Select-Object Name, CPU

# Arrays and loops
$numbers = 1..10
foreach ($number in $numbers) {
    if ($number % 2 -eq 0) {
        Write-Host "Even: $number" -ForegroundColor Green
    }
}

# Hash tables
$config = @{
    Server = "localhost"
    Port = 8080
    Enabled = $true
}

# Types
[System.Net.WebClient]$client = New-Object System.Net.WebClient

# Try-Catch blocks
try {
    $result = Invoke-RestMethod -Uri "https://api.example.com/data"
    Write-Output $result
}
catch {
    Write-Error "Failed to fetch data: $_"
}
finally {
    Write-Host "Operation completed"
}

# Pipeline and advanced filtering
Get-ChildItem -Path "C:\Temp" -Recurse |
    Where-Object { $_.Extension -eq ".log" -and $_.LastWriteTime -gt (Get-Date).AddDays(-7) } |
    Sort-Object Length -Descending |
    Select-Object -First 10

# Class definition
class Person {
    [string]$Name
    [int]$Age
    
    Person([string]$name, [int]$age) {
        $this.Name = $name
        $this.Age = $age
    }
    
    [string] GetInfo() {
        return "$($this.Name) is $($this.Age) years old"
    }
}

# Create instance
$person = [Person]::new("Alice", 25)
Write-Output $person.GetInfo()
