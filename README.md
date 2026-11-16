# Nmap Enumeration Lab Workflow

A GitHub-ready evidence and reporting workflow for the Cisco-style **Lab 1.2 – Enumeration with Nmap** exercise.

> **Scope and safety:** Run these scans only in the authorized lab environment described in the lab handout. The intended lab network is `10.6.6.0/24` and the target is `10.6.6.23`. Do not point the commands at public, third-party, or workplace systems unless you have explicit written authorization.

## Lab objectives

- Verify the Kali Linux network interface and Nmap installation.
- Review common Nmap options.
- Discover active hosts in the lab DMZ.
- Identify open ports, operating-system clues, and service versions on `10.6.6.23`.
- Enumerate SMB users and shares with Nmap Scripting Engine (NSE).
- Record evidence and assess security risks.

## Repository structure

```text
nmap-enumeration-workflow/
├── README.md
├── .gitignore
├── commands/
│   └── nmap-commands.md
├── docs/
│   ├── lab-notes.md
│   ├── findings-report-template.md
│   └── screenshot-checklist.md
├── evidence/
│   ├── scan-logs/
│   │   └── .gitkeep
│   └── screenshots/
│       └── .gitkeep
├── results/
│   ├── discovery/
│   │   └── .gitkeep
│   ├── host-enumeration/
│   │   └── .gitkeep
│   └── smb-enumeration/
│       └── .gitkeep
└── scripts/
    └── run-lab-scans.sh
```

## Requirements

- Kali Linux VM connected to the lab network.
- Nmap installed.
- Permission to scan the lab subnet and target.
- A terminal and a way to capture screenshots.

Check the environment:

```bash
ip -br addr
nmap -V
```

The lab handout uses `ifconfig`; on systems where it is installed, you can also run:

```bash
ifconfig
```

## Suggested workflow

1. Read `docs/lab-notes.md`.
2. Review the commands in `commands/nmap-commands.md`.
3. Capture the required terminal evidence using `docs/screenshot-checklist.md`.
4. Run the commands manually, or use `scripts/run-lab-scans.sh` after checking its scope and prompts.
5. Save raw Nmap output in the matching `results/` folder and screenshots in `evidence/screenshots/`.
6. Complete `docs/findings-report-template.md` using your own scan output.
7. Update this README with a short summary only after the lab is complete.

## Run the helper script

From the repository root:

```bash
chmod +x scripts/run-lab-scans.sh
./scripts/run-lab-scans.sh
```

The script asks for confirmation before scanning and saves timestamped output under `results/`. Review the script before running it. The subnet discovery scan covers the lab subnet; the remaining scans target only `10.6.6.23`.

## Evidence and reporting rules

- Keep raw scan output. Do not replace it with paraphrased notes.
- Do not invent scan results. The target may respond differently from the sample output in the handout.
- Redact personal usernames, unrelated IP addresses, public IPs, tokens, and other sensitive information before publishing.
- Do not upload VM credentials, private keys, packet captures containing unrelated traffic, or confidential data.
- Screenshots should show the command and relevant output, with unrelated desktop information excluded.

## Lab handout reference

This workflow follows the task sequence and lab target/network described in the supplied **Lab 1.2.pdf – Lab: Enumeration with Nmap**. The sample output in the handout includes `vsftpd 3.0.3` on FTP and Samba service details, but your own evidence must determine the results for your run.
