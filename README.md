# Lab 01 — Windows Server & Active Directory

## 1. Overview

This lab simulates a small company IT environment using Oracle VirtualBox, Windows Server, and Active Directory.

The fictional company, **CausTech Technologies**, uses a centralized domain to manage user accounts, security groups, computers, and network services.

The goal of this project was to build a working Windows Server domain controller and gain hands-on experience with core systems administration tasks.

## 2. Virtual Machine Setup

The lab began by creating a virtual machine in Oracle VirtualBox.

The virtual machine was configured with the Windows Server installation ISO, allocated RAM and CPU resources, and assigned virtual disk storage.

**Key tasks:**

* Created the Windows Server virtual machine.
* Selected the Windows Server ISO.
* Configured memory and processor resources.
* Created and configured the virtual hard disk.

**Screenshots:**

![VirtualBox main window](screenshots/phase-1-active-directory/01.png)

![Virtual machine configuration](screenshots/phase-1-active-directory/03.png)

![Virtual machine RAM and CPU](screenshots/phase-1-active-directory/04.png)

![Virtual machine resources and storage](screenshots/phase-1-active-directory/05.png)

## 3. Windows Server Installation

After configuring the virtual machine, Windows Server was installed.

The initial sign-in used the built-in local Administrator account because the Active Directory domain and domain user accounts had not yet been created.

After installation, the initial Windows Server desktop was accessed to begin configuration.

**Key tasks:**

* Completed the Windows Server installation.
* Signed in using the local Administrator account.
* Reviewed the initial server desktop.

**Screenshots:**

![Windows Server installation](screenshots/phase-1-active-directory/08.png)

![Windows Server installation2](screenshots/phase-1-active-directory/14.png)

![First sign-in as local Administrator](screenshots/phase-1-active-directory/19.png)

![Initial Windows Server desktop](screenshots/phase-1-active-directory/21.png)

## 4. Domain Controller Preparation

The server was renamed to `DC01` to identify its role as the domain controller.

A static IPv4 address was configured to provide a consistent network address for Active Directory and DNS services. The network configuration was then checked using `ipconfig /all`.

**Network configuration:**

| Setting              | Value           |
| -------------------- | --------------- |
| Computer name        | `DC01`          |
| IPv4 address         | `192.168.10.10` |
| Subnet mask          | `255.255.255.0` |
| Preferred DNS server | `192.168.10.10` |

**Key tasks:**

* Renamed the server to `DC01`.
* Configured its static IPv4 address.
* Configured DNS to point to the server itself.
* Disabled IPv6 on the network adapter as part of this lab's configuration.
* Verified the applied settings using PowerShell.

**Screenshots:**

![Renaming the server to DC01](screenshots/phase-1-active-directory/26.png)

![Searching for ethernet configuration](screenshots/phase-1-active-directory/33.png)

![Disabling IPv6](screenshots/phase-1-active-directory/33.png)

![Static IPv4 and Ethernet configuration](screenshots/phase-1-active-directory/35.png)

![ipconfig all verification](screenshots/phase-1-active-directory/37.png)

## 5. Active Directory Domain Services Installation

Active Directory Domain Services (AD DS) was installed to enable centralized identity and computer management.

During domain controller promotion, the Directory Services Restore Mode (DSRM) password was configured, and the new domain was specified.

The domain created for this lab was:

* **Domain:** `caustech.local`
* **NetBIOS name:** `CAUSTECH`

After promotion, PowerShell was used to inspect the domain configuration with `Get-ADDomain`.

**Key tasks:**

* Installed the AD DS role.
* Configured the DSRM password.
* Created the `caustech.local` domain.
* Promoted the server to a domain controller.
* Inspected domain information using PowerShell.

**Screenshots:**

![Installing the AD DS role](screenshots/phase-1-active-directory/43.png)

![Installing the AD DS role2](screenshots/phase-1-active-directory/47.png)

![Domain controller promotion and domain configuration](screenshots/phase-1-active-directory/48.png)

![Domain controller promotion and domain configuration2](screenshots/phase-1-active-directory/50.png)

![Get-ADDomain PowerShell verification](screenshots/phase-1-active-directory/64.png)

## 6. Active Directory Structure

Active Directory Users and Computers was used to organize the company's directory into Organizational Units (OUs).

The OU structure separates users by department and provides dedicated locations for computer accounts and security groups.

The structure created for this lab was:

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
└── CausTech Groups
```

The built-in Domain Controllers OU contains the `DC01` computer account.

**Key tasks:**

* Opened Active Directory Users and Computers.
* Created departmental OUs.
* Organized the directory for users, computers, and groups.

**Screenshots:**

![Active Directory Users and Computers](screenshots/phase-1-active-directory/66.png)

![Completed Organizational Unit structure](screenshots/phase-1-active-directory/70.png)

## 7. Security Group Configuration

Security groups were created to organize users and support role-based access management.

The first group created was `IT-Admins`. Additional groups were created for IT, HR, Finance, and Sales.

The groups created for this lab were:

* `IT-Admins`
* `IT-Users`
* `HR-Users`
* `Finance-Users`
* `Sales-Users`

**Key tasks:**

* Created the `IT-Admins` security group.
* Created departmental security groups.
* Reviewed the completed group list.

**Screenshots:**

![Creating the IT-Admins security group](screenshots/phase-1-active-directory/72.png)

![Completed departmental security groups](screenshots/phase-1-active-directory/73.png)

## 8. Domain User Creation

The first domain user account, `jcarter`, was created manually to establish the initial user-management workflow.

The account was then added to the `IT-Admins` security group as part of the lab exercise.

Additional fictional employee accounts were created with PowerShell to demonstrate user-account automation. The script defines each user's department and corresponding security group.

The other nine accounts were:

* `swilson`
* `ebrown`
* `mdavis`
* `dsmith`
* `jtaylor`
* `omartin`
* `randerson`
* `sthomas`
* `wjackson`

**Key tasks:**

* Created the initial `jcarter` account.
* Configured security group membership.
* Automated the creation of nine additional accounts with PowerShell.
* Reviewed users in the Sales department.

**Screenshots:**

![Creating the jcarter domain user](screenshots/phase-1-active-directory/74.png)

![Adding jcarter to IT-Admins](screenshots/phase-1-active-directory/81.png)

![PowerShell script for creating additional users](screenshots/phase-1-active-directory/85.png)

![Sales department users](screenshots/phase-1-active-directory/89.png)

The script is available in [`powershell/New-LabUsers.ps1`](powershell/New-LabUsers.ps1).

## 9. Active Directory Verification

PowerShell commands were used to inspect the domain and user accounts after configuration.

`Get-ADDomain` displays information about the Active Directory domain, while `Get-ADUser` can be used to retrieve user-account details.

These checks support verification of the directory configuration and created accounts.

**Screenshots:**

![Get-ADUser command and output](screenshots/phase-1-active-directory/92.png)

## 10. Results and Project Notes

This phase established the foundation of the CausTech Technologies lab environment.

**Completed work:**

* Windows Server virtual machine setup.
* Static IP and DNS configuration for `DC01`.
* Active Directory Domain Services installation and domain creation.
* Departmental Organizational Units and security groups.
* Ten fictional domain user accounts.
* PowerShell-based user creation.
* Initial Active Directory verification.

Further testing of the Windows 11 domain client and DHCP configuration is documented in the subsequent lab phases.

This is a personal home lab created for hands-on learning and IT portfolio development. CausTech Technologies is a fictional company.

**Supporting materials:**

* [PowerShell user-creation script](powershell/New-LabUsers.ps1)
* [Validation documentation](documentation/validation.md)

**Related project:** 
[Lab 02 — Windows Client](https://github.com/NicatGnc/CausTech-Lab-02-Windows-Client) 
