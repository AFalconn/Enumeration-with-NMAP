# Nmap Command Reference – Lab 1.2

Run only in the authorized lab environment. The supplied lab specifies the DMZ subnet `10.6.6.0/24` and target `10.6.6.23`.

## 1. Verify the environment

```bash
ifconfig
nmap -V
nmap -h
man nmap
```

Use `q` to exit the Nmap manual page.

## 2. Review the common options

| Option | Purpose |
|---|---|
| `-A` | Enables OS detection, version detection, script scanning, and traceroute. |
| `-O` | Attempts operating-system detection. |
| `-p <port ranges>` | Specifies ports or port ranges to scan. |
| `-sF` | TCP FIN scan. |
| `-sn` | Host discovery only; skips port scanning. |
| `-sS` | TCP SYN scan. |
| `-sT` | TCP connect scan. |
| `-sV` | Attempts to determine service/version information. |
| `-T<0-5>` | Sets timing template from 0 (slow) to 5 (fastest). |
| `-v` | Increases verbosity. |
| `--open` | Shows only open (or possibly open) ports. |

Confirm option descriptions against `man nmap` on your installed version.

## 3. Discover active hosts on the lab DMZ

```bash
nmap -sn 10.6.6.0/24
```

Save the terminal output to `results/discovery/` or use:

```bash
nmap -sn 10.6.6.0/24 -oA results/discovery/dmz-discovery
```

Record the number of active hosts reported by your scan.

## 4. Default scan of the suspicious host

```bash
nmap 10.6.6.23
```

Save output:

```bash
nmap 10.6.6.23 -oA results/host-enumeration/default-scan
```

Record all open ports and their service labels.

## 5. Operating-system detection

```bash
sudo nmap -O 10.6.6.23
```

Save output:

```bash
sudo nmap -O 10.6.6.23 -oA results/host-enumeration/os-detection
```

OS detection may be inconclusive or require elevated privileges.

## 6. FTP service/version enumeration

```bash
nmap -v -p21 -sV -T4 10.6.6.23
nmap -p21 -sV -A 10.6.6.23
```

Save output:

```bash
nmap -p21 -sV -A 10.6.6.23 -oA results/host-enumeration/ftp-enumeration
```

The `-A` scan is more intrusive than a basic scan. Use it only in the authorized lab.

## 7. SMB service enumeration

```bash
nmap -A -p139,445 10.6.6.23
```

Save output:

```bash
nmap -A -p139,445 10.6.6.23 -oA results/smb-enumeration/smb-service-enumeration
```

Enumerate SMB users:

```bash
nmap --script smb-enum-users.nse -p139,445 10.6.6.23
```

Save output:

```bash
nmap --script smb-enum-users.nse -p139,445 10.6.6.23 -oA results/smb-enumeration/smb-users
```

Enumerate SMB shares:

```bash
nmap --script smb-enum-shares.nse -p445 10.6.6.23
```

Save output:

```bash
nmap --script smb-enum-shares.nse -p445 10.6.6.23 -oA results/smb-enumeration/smb-shares
```

## Output formats

Nmap's `-oA <basename>` writes three formats:

- `.nmap` – human-readable output.
- `.gnmap` – grepable output.
- `.xml` – XML output for tools and structured analysis.

Do not assume a port, host, username, or share is present because it appears in the handout's example. Use the results from your own lab run.
