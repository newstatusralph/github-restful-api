#!/bin/bash
read -p "Password?" -s passwd
encrypt=$(cat << EOF
U2FsdGVkX19VmpFg04ptbHzRDrpLqCb7rxH4dG28vohGT4bpnUMcdCjmYn+5oOWY
hfH6w1RhzRLOTYdftVrgcg==
EOF
)
token=$(echo -ne "$encrypt" | openssl enc -aes-256-cbc -a -d -md sha512 -iter 10000 -pass pass:$passwd)
user=newstatusralph
repo=github-restful-api
curl --request POST \
    --url 'https://api.github.com/repos/'$user'/'$repo'/dispatches' \
    --header 'authorization: Bearer '$token \
    --data '{"event_type": "hello", "client_payload": {"message": {"foo": "bar"}}}'
