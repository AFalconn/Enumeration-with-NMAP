# Lab Notes – Enumeration with Nmap

## Scenario

The lab describes unusual activity involving a computer on the DMZ network. The suspicious host identified in the scenario is `10.6.6.23`. The analyst has access to a Kali Linux system on the `10.6.6.0/24` network.

## Network details from the handout

| Item | Value |
|---|---|
| DMZ subnet | `10.6.6.0/24` |
| Target host | `10.6.6.23` |
| Lab system | Kali Linux VM |
| Tool | Nmap |

## Part 1 – Investigate Nmap

- Verify the Kali network interface.
- Verify Nmap installation/version with `nmap -V`.
- Review command help with `nmap -h`.
- Review detailed options with `man nmap`.
- Complete the options table in the lab worksheet or findings report.

## Part 2 – Perform basic Nmap scans

1. Discover active hosts using `nmap -sn 10.6.6.0/24`.
2. Run a default scan against `10.6.6.23`.
3. Attempt OS detection with `sudo nmap -O 10.6.6.23`.
4. Enumerate FTP on port 21 using service/version detection.
5. Run the lab's FTP-focused `-A` scan and review whether anonymous FTP access is reported.
6. Enumerate SMB ports 139 and 445.
7. Run the SMB user-enumeration script.
8. Run the SMB share-enumeration script.
9. Answer the reflection questions based on the evidence collected.

## Important interpretation notes

- A TCP port reported as `open` indicates a service is listening.
- `closed` indicates the host responded but no service is listening on that port.
- `filtered` indicates Nmap could not determine whether the port is open because traffic was filtered or responses were blocked.
- Anonymous FTP access, if confirmed, may expose files without an individual user account.
- SMB shares with anonymous read/write access can expose information and may permit unauthorized modification.
- SMB message signing being disabled or not required can weaken protection against certain attacks. Assess the exact finding in context rather than claiming exploitation occurred.

## Sample details shown in the supplied handout

The handout's illustrative FTP output identifies `vsftpd 3.0.3` and reports anonymous FTP login allowed, with four listed files. Its illustrative SMB output identifies Samba services, the NetBIOS name `868CF29B394C`, and shares including `IPC$`, `print$`, and `workfiles`. These are sample lab outputs, not a substitute for the learner's own scan evidence.
