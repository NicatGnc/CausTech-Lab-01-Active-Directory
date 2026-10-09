# Lab 01 — Validation and Testing

## Purpose

This document records the validation checks used to confirm that the CausTech Active Directory lab was configured correctly.

## Test Results

| Test                           | Method                                           | Expected Result                                        | Status              |
| ------------------------------ | ------------------------------------------------ | ------------------------------------------------------ | ------------------- |
| Domain controller              | Review Server Manager and Active Directory tools | DC01 provides Active Directory Domain Services and DNS | Passed              |
| Domain structure               | Inspect Active Directory Users and Computers     | Department OUs, users, and security groups are present | Passed              |
| Domain membership              | Inspect CLIENT01 in Active Directory             | CLIENT01 appears in the domain                         | Passed              |
| Domain authentication          | Sign in using a domain account                   | Domain user can sign in to CLIENT01                    | Passed              |
| DHCP configuration             | Inspect the DHCP console                         | The CausTech-LAN scope is configured and activated     | Passed              |
| Automatic addressing           | Run `ipconfig /all` on CLIENT01                  | Client receives its IP configuration from DHCP         | Verified during lab |
| DNS resolution                 | Run `nslookup caustech.local`                    | The internal domain name resolves through DC01         | Verified during lab |
| Domain controller connectivity | Run `ping 192.168.10.10`                         | CLIENT01 can reach DC01 over the lab network           | Verified during lab |

## Commands Used

### Check network configuration

```cmd
ipconfig /all
```

Used to inspect the client IPv4 address, DHCP server, DNS server, and DNS suffix.

### Test connectivity to DC01

```cmd
ping 192.168.10.10
```

Used to check IP connectivity between CLIENT01 and the domain controller.

### Test DNS resolution

```cmd
nslookup caustech.local
```

Used to check whether the internal domain name resolves through DNS.

### Confirm the signed-in identity

```cmd
whoami
```

When signed in as John Carter, the expected identity is:

```text
caustech\jcarter
```

## Troubleshooting Notes

During setup, the Windows 11 client initially had difficulty authenticating against the domain. The client and domain connectivity were subsequently checked, and domain sign-in succeeded.

The VirtualBox environment also encountered a host disk-space error during VM setup. Moving the virtual machines to a drive with sufficient free space allowed the lab setup to continue.

## Conclusion

The lab demonstrates a working Active Directory domain environment with a Windows Server domain controller, domain users and groups, DNS, DHCP, and a domain-joined Windows 11 client.

Screenshots will provide supporting evidence for the configuration and validation steps.
