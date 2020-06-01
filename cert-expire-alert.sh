#!/bin/sh

set -euf

DATE=${DATE:-date}

if ! >/dev/null 2>&1 $DATE --version; then
    echo "$DATE is not GNU date" 1>&2
    exit 1
fi

expire_date=$(0</dev/null 2>/dev/null openssl s_client -connect "$1" |
                  openssl x509 -noout -enddate |
                  cut -d = -f 2)
expire_secs=$("$DATE" --date "$expire_date" +%s)
remaining_secs=$(( expire_secs - $(date +%s) ))

echo "Expire at $expire_date"

if [ $remaining_secs -lt $(( 14 * 24 * 3600 )) ]
then
    echo "WARNING The certificate will expire soon"
    exit 1
else
    echo "The certificate is good"
fi
