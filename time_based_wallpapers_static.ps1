# Image paths
$morning = "C:\Users\username\images\wallpapers\1.jpeg"
$afternoon = "C:\Users\username\images\wallpapers\2.jpeg"
$evening = "C:\Users\username\images\wallpapers\3.jpeg"
$night = "C:\Users\username\images\wallpapers\4.jpeg"

# Current hour
$currentHour = (Get-Date).Hour

# Selects the wallpaper based on the current hour
# To change the schedule or add more time slots, modify or add another elseif condition
if ($currentHour -ge 6 -and $currentHour -lt 16) {
    $wallpaper = $morning
} elseif ($currentHour -ge 16 -and $currentHour -lt 19) {
    $wallpaper = $afternoon
} elseif ($currentHour -ge 19 -and $currentHour -lt 23) {
    $wallpaper = $evening
} else {
    $wallpaper = $night
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
Set-Wallpaper -path $wallpaper
