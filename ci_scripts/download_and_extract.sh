#!/bin/bash
curl --fail $1 --output byond_download.zip
unzip byond_download.zip
rm byond_download.zip
