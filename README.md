# time-based-wallpapers

A PowerShell script that automatically changes your desktop wallpaper based on the time of day. This script supports multiple monitors and allows for easy customization of wallpaper paths and time intervals. Ideal for creating a dynamic and personalized desktop experience.

## How to Run the Script and Add It to the Windows Task Scheduler

This guide will walk you through the steps required to execute the script correctly and add it to the Windows Task Scheduler to automate wallpaper changes based on the time of day.

### Prerequisites

1. **Windows PowerShell**: Ensure you have Windows PowerShell installed on your system.
2. **Script File**: Save the script to a `.ps1` file, e.g., `time_based_wallpapers.ps1`.

## Preparing the Script

Before running the `time_based_wallpapers.ps1` script, you need to customize it by specifying the paths to your wallpaper images. Follow these steps to prepare the script:

1. **Locate Your Wallpaper Images**

   - Ensure you have the wallpaper images saved in a directory on your system. For example, let's say your images are located in `C:\Users\username\images\wallpapers`. Make a note of this directory path.

2. **Edit the Script**

   - Open the `time_based_wallpapers.ps1` script file in a text editor such as Notepad or Visual Studio Code. You'll need to modify the script to point to your specific wallpaper images.

3. **Update Image Paths**

   - Find the following section in the script, replace the paths and save the script.:

```powershell
$morning = "C:\Users\username\images\wallpapers\1.jpeg"
$afternoon = "C:\Users\username\images\wallpapers\2.jpeg"
$evening = "C:\Users\username\images\wallpapers\3.jpeg"
$night = "C:\Users\username\images\wallpapers\4.jpeg"
```

## Steps to Execute the Script

1. **Open PowerShell as Administrator**:
   - Press `Windows + X` and select `Windows PowerShell (Admin)` or `Terminal (Admin)`.

2. **Set Execution Policy**:
   - In the PowerShell window, set the execution policy to allow running scripts. Execute the following command:
     ```powershell
     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
     ```
   - When prompted, type `Y` and press `Enter`.

3. **Test the Script**:
   - Navigate to the directory where your script is saved using the `cd` command. For example:
     ```powershell
     cd C:\Users\your_script_path\
     ```
   - Run the script:
     ```powershell
     .\time_based_wallpapers.ps1
     ```
   - Verify that the wallpaper changes according to the current time.

### Adding the Script to the Windows Task Scheduler

1. **Open Task Scheduler**:
   - Press `Windows + S`, type `Task Scheduler`, and press `Enter`.

2. **Create a New Task**:
   - In the Task Scheduler, click on `Create Task` in the `Actions` pane.

3. **General Settings**:
   - Name the task, e.g., `Change Wallpaper Based on Time`.
   - Select `Run only when user is logged on`.

4. **Trigger Settings**:
   - Go to the `Triggers` tab and click `New`.
   - Set the task to start `At log on` and repeat every hour (or your preferred interval). For example:
     - Begin the task: `At log on`
     - Repeat task every: `1 hour`
     - For a duration of: `Indefinitely`
     - Set: `Enabled`
     - Click `OK`.

5. **Action Settings**:
   - Go to the `Actions` tab and click `New`.
   - Set `Action` to `Start a program`.
   - In the `Program/script` field, enter `powershell`.
   - In the `Add arguments (optional)` field, enter the following, replacing the path with the location of your script:
     ```powershell
     -NonInteractive -WindowStyle Hidden -File C:\Users\your_script_path\time_based_wallpapers.ps1
     ```
   - Click `OK`.

6. **Conditions and Settings**:
   - Adjust any other settings or conditions as needed in the `Conditions` and `Settings` tabs.

7. **Save the Task**:
   - Click `OK` to save the task.
   - You may be prompted to enter your password to create the task.

8. **Start the Task**:
   - Reboot your PC or log off and log in again to ensure the task starts as expected.

### Conclusion

Your script is now set up to run automatically at the specified intervals, ensuring your wallpaper changes based on the time of day. You can modify the script or task settings anytime if adjustments are needed.
