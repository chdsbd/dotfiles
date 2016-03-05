#!/usr/bin/env bash

# Clouflare's old v1 api - https://www.cloudflare.com/docs/client-api.html
# Takes API_KEY and record id as arguments

IP=`dig +short myip.opendns.com @resolver1.opendns.com`

curl https://www.cloudflare.com/api_json.html\
    -d "a=rec_edit"\
    -d "tkn=$1"\
    -d "email=chdignam@gmail.com"\
    -d "z=christopher.xyz"\
    -d "id=$2"\
    -d "type=A"\
    -d "name=$HOSTNAME"\
    -d "ttl=120"\
    -d "content=$IP"
