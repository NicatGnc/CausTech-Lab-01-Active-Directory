# Lab 01 — Active Directory Infrastructure

**Organization:** CausTech Technologies
**Project Type:** Home Lab | Systems Administration
**Status:** Completed

## Overview

This project establishes the foundational IT infrastructure for CausTech Technologies, a fictional company created for hands-on systems administration practice.

The lab simulates a small business network using Windows Server and Windows 11 virtual machines. Active Directory Domain Services provides centralized identity and computer management, while DNS and DHCP support internal name resolution and automatic network configuration.

## Infrastructure

| Component               | Configuration                   |
| ----------------------- | ------------------------------- |
| Domain Controller       | DC01                            |
| Client Workstation      | CLIENT01                        |
| Active Directory Domain | `caustech.local`                |
| NetBIOS Domain          | `CAUSTECH`                      |
| Virtual Network         | `CausTech-LAN`                  |
| Domain Controller IP    | `192.168.10.10`                 |
| DHCP Address Pool       | `192.168.10.100–192.168.10.200` |
| DNS Server              | `192.168.10.10`                 |
| Virtualization          | Oracle VirtualBox               |

## Implementation

* Installed and configured Windows Server.
* Assigned a static IPv4 address to DC01.
* Installed Active Directory Domain Services and DNS.
* Created the `caustech.local` domain.
* Designed departmental Organizational Units for IT, HR, Finance, and Sales.
* Created fictional user accounts and department security groups.
* Automated user creation and group membership with PowerShell.
* Installed and authorized DHCP and configured an IPv4 scope.
* Joined CLIENT01 to the Active Directory domain.
* Tested domain authentication and internal network configuration.

## Repository Contents

* `powershell/` — Scripts used to automate Active Directory administration.
* `documentation/` — Configuration notes, validation procedures, and test results.
* `screenshots/` — Visual evidence of the lab configuration and testing.

## Validation

The lab includes checks for domain membership, user authentication, DHCP configuration, DNS resolution, and connectivity between the client and domain controller.

See [Validation and Testing](documentation/validation.md) for the test procedures and results.

## Future Expansion

This environment is intended to serve as the foundation for additional CausTech infrastructure projects, including:

* **Lab 02 — File Server:** Departmental shares, NTFS permissions, and access control.
* **Lab 03 — Web Server:** IIS installation, website hosting, and internal DNS configuration.
* **Future labs:** Additional Windows administration, security, networking, and troubleshooting exercises.

## Disclaimer

CausTech Technologies is a fictional organization used for educational home lab projects. This repository documents simulated infrastructure built for learning and portfolio development; it does not represent a production deployment or commercial work experience.
