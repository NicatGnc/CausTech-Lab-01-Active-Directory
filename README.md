# Lab 01 — Windows Server & Active Directory

## Overview

This home lab simulates a small company IT environment using Oracle VirtualBox, Windows Server, and Windows 11.

The fictional company, CausTech Technologies, uses an Active Directory domain to centrally manage users, groups, computers, and network services.

## Lab Environment

| Component          | Configuration                   |
| ------------------ | ------------------------------- |
| Domain Controller  | DC01                            |
| Client Workstation | CLIENT01                        |
| Domain             | `caustech.local`                |
| NetBIOS Name       | `CAUSTECH`                      |
| Virtual Network    | `CausTech-LAN`                  |
| DC01 IP Address    | `192.168.10.10`                 |
| DHCP Scope         | `192.168.10.100–192.168.10.200` |
| DNS Server         | `192.168.10.10`                 |

## Tasks Completed

* Installed and configured Windows Server.
* Configured DC01 with a static IP address.
* Installed Active Directory Domain Services and DNS.
* Created the `caustech.local` domain.
* Created departmental Organizational Units (OUs).
* Created security groups for IT, HR, Finance, and Sales.
* Created 10 fictional domain user accounts.
* Used PowerShell to automate user creation and group membership.
* Installed and authorized the DHCP Server role.
* Created and activated a DHCP IPv4 scope.
* Joined CLIENT01 to the domain.
* Signed in using a domain account and configured automatic network addressing.

## Active Directory Structure

```text
caustech.local
├── CausTech Users
│   ├── IT
│   ├── HR
│   ├── Finance
│   └── Sales
├── CausTech Computers
│   ├── Workstations
│   └── Servers
├── CausTech Groups
└── Domain Controllers
    └── DC01
```

## Verification

The lab included testing domain sign-in, DHCP configuration, DNS resolution, and connectivity between CLIENT01 and DC01.

Screenshots and exact test results will be added to this repository as supporting evidence.


## Project Type

Personal home lab built for hands-on learning and IT portfolio development. CausTech Technologies is a fictional company.
