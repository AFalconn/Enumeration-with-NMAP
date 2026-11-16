#!/usr/bin/env bash
# Authorized lab-only Nmap workflow for Lab 1.2.
# Review this script and confirm you are connected to the intended lab network.

set -euo pipefail

TARGET="10.6.6.23"
SUBNET="10.6.6.0/24"
STAMP="$(date +%Y%m%d-%H%M%S)"
OUT="results"

echo "Nmap Enumeration Lab workflow"
echo "Subnet: ${SUBNET}"
echo "Target: ${TARGET}"
echo
echo "Only continue if you are authorized to scan this lab network."
read -r -p "Type LAB-OK to proceed: " CONFIRM
if [[ "${CONFIRM}" != "LAB-OK" ]]; then
  echo "Cancelled."
  exit 1
fi

mkdir -p "${OUT}/discovery" "${OUT}/host-enumeration" "${OUT}/smb-enumeration"

echo "[1/7] Discovering active hosts on the lab subnet..."
nmap -sn "${SUBNET}" -oA "${OUT}/discovery/dmz-discovery-${STAMP}"

echo "[2/7] Running default target scan..."
nmap "${TARGET}" -oA "${OUT}/host-enumeration/default-scan-${STAMP}"

echo "[3/7] Attempting OS detection (sudo may prompt for your password)..."
sudo nmap -O "${TARGET}" -oA "${OUT}/host-enumeration/os-detection-${STAMP}"

echo "[4/7] Enumerating FTP service/version..."
nmap -v -p21 -sV -T4 "${TARGET}" -oA "${OUT}/host-enumeration/ftp-version-${STAMP}"

echo "[5/7] Running the lab's FTP-focused aggressive scan..."
nmap -p21 -sV -A "${TARGET}" -oA "${OUT}/host-enumeration/ftp-aggressive-${STAMP}"

echo "[6/7] Enumerating SMB services and users..."
nmap -A -p139,445 "${TARGET}" -oA "${OUT}/smb-enumeration/smb-services-${STAMP}"
nmap --script smb-enum-users.nse -p139,445 "${TARGET}" -oA "${OUT}/smb-enumeration/smb-users-${STAMP}"

echo "[7/7] Enumerating SMB shares..."
nmap --script smb-enum-shares.nse -p445 "${TARGET}" -oA "${OUT}/smb-enumeration/smb-shares-${STAMP}"

echo
echo "Completed. Review all outputs before including them in a public repository."
echo "Capture screenshots separately in evidence/screenshots/."
