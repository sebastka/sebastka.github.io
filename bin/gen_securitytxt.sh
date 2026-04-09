#!/bin/sh
set -eu

rm -f ../.well-known/security.txt

{
    printf -- 'Contact: mailto:postmaster@karlsen.fr\n'
    printf -- 'Expires: %s\n' "$(date -d '-9 month ago' +'%Y-%m-%dT%H:%M:%S%z')"
    printf -- 'Encryption: dns:4dd68e2ab3a30973318ea903e088b3d3480655ef4236109fe47272c1._openpgpkey.karlsen.fr?type=OPENPGPKEY\n'
    printf -- 'Preferred-Languages: en, no, fr\n'
    printf -- 'Canonical: https://www.karlsen.fr/.well-known/security.txt\n'
} >../.well-known/security.unsigned.txt

gpg --clearsign \
    --local-user 94863C7F986D65E8 \
    --output ../.well-known/security.txt \
    /tmp/security.unsigned.txt

rm ../.well-known/security.unsigned.txt
