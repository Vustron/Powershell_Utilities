# PowerShell Utilities

![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)

This repository contains various PowerShell scripts that I made for web and mobile development. It also have documentation.

## Utilities

<details>
<summary><strong>cleanup.ps1 🧹</strong></summary>

The `cleanup.ps1` script will remove specific folders from a given directory. I made this script because of the slow deletion of cache folders in my nextjs projects on Windows 11 file explorer.

> **Note**: Ensure you have the necessary permissions to delete folders in the specified directory.

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

- **Interactive Folder Selection**: Prompts the user to enter the folders to remove.
- **Folder Existence Check**: Verifies if the specified folders exist before proceeding.
- **Confirmation Prompt**: Asks for final confirmation before deleting the folders.
- **Progress Display**: Shows the progress of the cleanup operation.
- **Size Calculation**: Calculates and displays the size of the folders being removed.

### Script Details 📝

The script performs the following steps:

1. Prompts the user to enter the folders to remove.
2. Checks if the specified folders exist.
3. Asks for final confirmation before proceeding.
4. Recursively scans the specified directory and removes the specified folders.
5. Displays the total size of the removed folders and the time taken for the cleanup.

### Notes

- Use the `-dryRun` switch to preview the folders that will be deleted without actually removing them.
</details>

<details>
<summary><strong>initialize_python.ps1 🐍</strong></summary>

The `initialize_python.ps1` script will set up a Python virtual environment, check python versions and create initial Python files. I made this to instantiate python with virtual environments quickly.

> **Note**: Ensure you have Python installed on your system.

### Usage

To run this script in PowerShell, navigate to the directory containing the script and execute the following command:

```powershell
.\initialize_python.ps1
```

### Features ✨

- **Virtual Environment Creation**: Creates a Python virtual environment in the specified directory.
- **Python Version Selection**: Prompts the user to select the Python version for the virtual environment.
- **Initial File Creation**: Creates `main.py` and `__init__.py` files in the project directory.

### Script Details 📝

The script performs the following steps:

1. Checks if Python is installed and retrieves its version.
2. Checks if `virtualenv` is installed, and installs it if necessary.
3. Lists available Python versions and prompts the user to select one.
4. Creates a irtual environment  using the selected Python version5. Activates the virtual environment.
6. Creates `main.py` and `__init__.py` files in the project directory.

### Notes

- Ensure you have the necessary permissions to create files and directories in the specified path.
</details>

### Contributing 🤝

Contributions are welcome! Please open an issue or submit a pull request.

### Contact 📧

For any questions or issues, you can email me on my gmail.

### Disclaimer ⚠️

These scripts are provided as-is without any warranty. Use them at your own risk. The author is not responsible for any damage or data loss that may occur from using these scripts.
