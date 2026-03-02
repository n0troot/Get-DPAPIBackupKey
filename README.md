[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue?logo=powershell)](https://github.com/PowerShell/PowerShell)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

# Get-DPAPIBackupKey

A simple PowerShell script to extract DPAPI backup keys from Active Directory.

## Description

This utility performs a direct ADSI (Active Directory Service Interfaces) search to locate and retrieve DPAPI (Data Protection API) backup keys stored in the Active Directory System container.

## Features

- Easy-to-use interactive domain input
- Searches Active Directory for secret objects
- Extracts binary key data from LDAP properties
- Automatically saves extracted keys to local files

## Usage

```powershell
.\Get-DPAPIBackupKey.ps1
```

When prompted, enter your full domain name (e.g., `example.com`).

The script will:
1. Connect to your Active Directory via LDAP
2. Search for secret objects in the System container
3. Extract all binary properties
4. Save each key to a local file in the format: `{KeyName}-{PropertyName}.key`

## Requirements

- PowerShell
- Active Directory access
- Appropriate permissions to query Active Directory

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
