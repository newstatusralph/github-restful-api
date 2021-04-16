#!/bin/bash
user=newstatusralph
token=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
repo=github-restful-api
curl --request POST \
    --url 'https://api.github.com/repos/'$user'/'$repo'/dispatches' \
    --header 'authorization: Bearer '$token \
    --data '{"event_type": "hello", "client_payload": {"message": {"foo": "bar"}}}'
