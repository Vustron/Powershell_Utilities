# PowerShell Utilities

![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)

## PowerShell Utils 🚀

This repository contains various PowerShell scripts to help with common development tasks. Below is the documentation for one of the scripts included in this repository.

## cleanup.ps1 🧹

The `cleanup.ps1` script is designed to remove specific folders from a given directory. I made this script because the Windows 11 file explorer takes too long to delete the cache folders on the projects I've made.

> **Note**: Ensure you have the necessary permissions to delete the folders in the specified directory.

### Usage

To run this script in PowerShell, navigate to the directory containing the script and execute the following command:

```powershell
.\cleanup.ps1
```

### Parameters

- `-path`: Specifies the root directory where the cleanup should start. Defaults to the current directory.
- `-dryRun`: If specified, the script will only display the folders that would be removed without actually deleting them.
- `-verbose`: If specified, the script will display additional information about the folders being scanned.

### Example

```powershell
.\cleanup.ps1 -path "C:\Projects\MyApp" -dryRun -verbose
```

### Features ✨

- **Interactive Folder Selection**: The script prompts the user to enter the folders to remove.
- **Folder Existence Check**: Before proceeding, the script checks if the specified folders exist.
- **Confirmation Prompt**: The script asks for final confirmation before deleting the folders.
- **Progress Display**: The script shows the progress of the cleanup operation.
- **Size Calculation**: The script calculates and displays the size of the folders being removed.

### Script Details 📝

The script performs the following steps:

1. Prompts the user to enter the folders to remove.
2. Checks if the specified folders exist.
3. Asks for final confirmation before proceeding.
4. Recursively scans the specified directory and removes the specified folders.
5. Displays the total size of the removed folders and the time taken for the cleanup.

### Notes

- Use the `-dryRun` switch to preview the folders that will be deleted without actually removing them.

### License 📄

This project is licensed under the MIT License.

### Contributing 🤝

Contributions are welcome! Please open an issue or submit a pull request.

### Contact 📧

For any questions or issues, please contact the repository owner.

### Disclaimer ⚠️

This script is provided as-is without any warranty. Use it at your own risk. The author is not responsible for any damage or data loss that may occur from using this script.
