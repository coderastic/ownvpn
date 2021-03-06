#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/env.sh

if [[ ! -e $PPTPOPTIONS ]] || [[ ! -r $PPTPOPTIONS ]] || [[ ! -w $PPTPOPTIONS ]]; then
    echo "$PPTPOPTIONS is not exist or not accessible (are you root?)"
    exit 1
fi

DEFAULTDNS1="1.1.1.1"
DEFAULTDNS2="1.0.0.1"

read -p "DNS #1: " -e -i $DEFAULTDNS1 DNS1
: ${DNS1:=$DEFAULTDNS1}

read -p "DNS #2: " -e -i $DEFAULTDNS2 DNS2
: ${DNS2:=$DEFAULTDNS2}

sed -i -e "/ms-dns/d" $PPTPOPTIONS

echo "ms-dns $DNS1" >> $PPTPOPTIONS
echo "ms-dns $DNS2" >> $PPTPOPTIONS

echo "$PPTPOPTIONS updated!"
