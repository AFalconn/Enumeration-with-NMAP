# Nmap Enumeration – Findings Report

## 1. Assessment details

- **Lab:** Lab 1.2 – Enumeration with Nmap
- **Date/time:**
- **Analyst:**
- **Environment:** Authorized Kali Linux lab
- **Subnet:** `10.6.6.0/24`
- **Target:** `10.6.6.23`

## 2. Environment verification

- Kali interface/IP:
- Nmap version:
- Evidence filename:

## 3. DMZ host discovery

- Command: `nmap -sn 10.6.6.0/24`
- Number of active hosts:
- Host addresses observed:
- Output file:

## 4. Target port scan

- Command: `nmap 10.6.6.23`
- Open ports:
- Closed/filtered observations:
- Output file:

| Port | State | Service | Version (if identified) | Notes |
|---|---|---|---|---|
|  |  |  |  |  |

## 5. Operating-system detection

- Command: `sudo nmap -O 10.6.6.23`
- OS guess/result:
- Confidence or limitations:
- Output file:

## 6. FTP enumeration

- Command(s):
- FTP service/version:
- Anonymous login allowed?:
- Number/names of files listed (if any):
- Output file:
- Security implication:

## 7. SMB enumeration

### Service scan

- Ports 139/445 state:
- SMB/Samba version:
- Workgroup:
- NetBIOS computer name:
- Message-signing result:

### User enumeration

- Command:
- Were usernames identified?:
- Number of usernames:
- Output file:

### Share enumeration

- Command:
- Shares discovered:
- Number of hidden shares (names ending in `$`):
- Anonymous access permissions:
- Output file:

## 8. Key security observations

| Finding | Evidence | Potential impact | Recommended defensive action |
|---|---|---|---|
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

## 9. Reflection questions

### How can Nmap help internal network technicians, and how could attackers misuse it?

Write a short evidence-informed response here.

### What serious security risks would you report for `10.6.6.23`?

List only risks supported by your scan output. Distinguish observed exposure from confirmed exploitation.

## 10. Evidence index

| Evidence ID | Filename | What it demonstrates |
|---|---|---|
| E01 |  | Kali interface and Nmap version |
| E02 |  | DMZ host discovery |
| E03 |  | Default target scan |
| E04 |  | OS detection |
| E05 |  | FTP enumeration |
| E06 |  | SMB service enumeration |
| E07 |  | SMB user enumeration |
| E08 |  | SMB share enumeration |
