# Image directories
$morningDir = "C:\Users\username\images\wallpapers\morning"
$afternoonDir = "C:\Users\username\images\wallpapers\afternoon"
$eveningDir = "C:\Users\username\images\wallpapers\evening"
$nightDir = "C:\Users\username\images\wallpapers\night"

# Current hour
$currentHour = (Get-Date).Hour

# Function to get a random wallpaper from a directory
function Get-RandomWallpaper {
    param (
        [Parameter(Mandatory = $true)]
        [string]$directory
    )

    $supportedExtensions = @('*.jpg', '*.jpeg', '*.png')
    $files = @()

    foreach ($ext in $supportedExtensions) {
        $files += Get-ChildItem -Path $directory -Filter $ext
    }

    if ($files.Count -gt 0) {
        return $files | Get-Random
    } else {
        throw "No supported wallpaper files found in $directory"
    }
}

# Select the wallpaper directory based on the current hour
if ($currentHour -ge 6 -and $currentHour -lt 16) {
    $wallpaper = Get-RandomWallpaper -directory $morningDir
} elseif ($currentHour -ge 16 -and $currentHour -lt 19) {
    $wallpaper = Get-RandomWallpaper -directory $afternoonDir
} elseif ($currentHour -ge 19 -and $currentHour -lt 23) {
    $wallpaper = Get-RandomWallpaper -directory $eveningDir
} else {
    $wallpaper = Get-RandomWallpaper -directory $nightDir
}

# Function to change the wallpaper on all monitors
function Set-Wallpaper {
    param (
        [Parameter(Mandatory = $true)]
        [string]$path
    )

    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

    [Wallpaper]::SystemParametersInfo(0x0014, 0, $path, 0x0001 -bor 0x0002)
}

# Changes the wallpaper on all monitors
Set-Wallpaper -path $wallpaper.FullName
