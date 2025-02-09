#!/bin/bash
set -euo pipefail

curl --fail $1 --output byond_download.zip
unzip -q byond_download.zip
rm byond_download.zip
