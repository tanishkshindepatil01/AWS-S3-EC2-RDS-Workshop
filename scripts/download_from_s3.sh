#!/usr/bin/env bash
# Run on EC2 after attaching the workshop S3 IAM role.
set -euo pipefail
if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo 'Usage: bash scripts/download_from_s3.sh BUCKET_NAME [DESTINATION]' >&2
  exit 2
fi
bucket_name="$1"
destination="${2:-/home/ec2-user}"
if [[ "$bucket_name" == 'YOUR_BUCKET_NAME' || "$bucket_name" == *'/'* ]]; then
  echo 'Supply the actual bucket name without s3:// or a path.' >&2
  exit 2
fi
command -v aws >/dev/null || { echo 'AWS CLI is required.' >&2; exit 1; }
mkdir -p "$destination"
for filename in bristol.txt AMZN.csv Water.csv; do
  aws s3 cp "s3://$bucket_name/$filename" "$destination/$filename"
done
ls -lh "$destination/bristol.txt" "$destination/AMZN.csv" "$destination/Water.csv"
