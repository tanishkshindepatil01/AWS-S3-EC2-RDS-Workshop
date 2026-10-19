#!/usr/bin/env bash
# Run on Amazon Linux 2023 with the MariaDB mysql client installed.
set -euo pipefail
if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo 'Usage: bash scripts/connect_rds.sh RDS_ENDPOINT [MASTER_USERNAME]' >&2
  exit 2
fi
rds_endpoint="$1"
master_username="${2:-admin}"
if [[ "$rds_endpoint" == 'YOUR_RDS_ENDPOINT' || "$rds_endpoint" == *'/'* || "$rds_endpoint" == *':'* ]]; then
  echo 'Supply the actual RDS hostname without https:// or :3306.' >&2
  exit 2
fi
command -v mysql >/dev/null || { echo 'Install the client: sudo dnf install mariadb105 -y' >&2; exit 1; }
command -v curl >/dev/null || { echo 'curl is required.' >&2; exit 1; }
certificate_dir="$HOME/.cache/lsde-week5"
mkdir -p "$certificate_dir"
curl --fail --silent --show-error --location \
  https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem \
  --output "$certificate_dir/global-bundle.pem"
exec mysql --local-infile=1 -h "$rds_endpoint" -P 3306 \
  -u "$master_username" -p \
  --ssl-ca="$certificate_dir/global-bundle.pem" \
  --ssl-verify-server-cert
