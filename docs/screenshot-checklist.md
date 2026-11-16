# Screenshot Checklist

Save screenshots in `evidence/screenshots/`. Use clear filenames and capture the command plus enough output to support the finding.

Recommended screenshots:

- [ ] `01-kali-interface.png` – Kali interface showing its lab-network address.
- [ ] `02-nmap-version.png` – `nmap -V` output.
- [ ] `03-dmz-discovery.png` – `nmap -sn 10.6.6.0/24` and active-host results.
- [ ] `04-default-target-scan.png` – default scan of `10.6.6.23`.
- [ ] `05-os-detection.png` – `sudo nmap -O 10.6.6.23`.
- [ ] `06-ftp-enumeration.png` – FTP service/version and relevant script output.
- [ ] `07-smb-services.png` – SMB ports 139/445 service scan.
- [ ] `08-smb-users.png` – SMB user-enumeration result.
- [ ] `09-smb-shares.png` – SMB share-enumeration result.

## Screenshot quality

- Keep terminal text readable.
- Include the full command and relevant result.
- Avoid cropping out the target IP or port/service context.
- Do not expose passwords, private keys, personal files, or unrelated network information.
- Use PNG format where possible.
- Only mark a screenshot complete after you have actually captured it.
