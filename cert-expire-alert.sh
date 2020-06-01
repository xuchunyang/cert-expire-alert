#!/bin/sh

set -euf

if [ $# -lt 1 ] || [ "$1" = "--help" ]
then
    echo "usage: $(basename "$0") hostname" 1>&2
    exit 1
fi

HOST=$1
PORT=443
DAYS=14

DATE=${DATE:-date}

if ! >/dev/null 2>&1 $DATE --version; then
    echo "$DATE is not GNU date" 1>&2
    exit 1
fi

expire_date=$(0</dev/null 2>/dev/null openssl s_client -connect "$HOST:$PORT" -servername "$HOST" |
                  openssl x509 -noout -enddate |
                  cut -d = -f 2)
expire_secs=$("$DATE" --date "$expire_date" +%s)
remaining_secs=$(( expire_secs - $(date +%s) ))

echo "Expire at $expire_date"

remaining_days=$(echo "scale=2; $remaining_secs / (24 * 3600)" | bc)
if [ $remaining_secs -lt $(( DAYS * 24 * 3600 )) ]
then
    echo "BAD The certificate remains $remaining_days days"
    exit 1
else
    echo "GOOD The certificate remains $remaining_days days"
    exit 0
fi
