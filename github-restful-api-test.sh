#!/bin/bash
user=newstatusralph
token=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
repo=github-restful-api
curl --request POST \
    --url 'https://api.github.com/repos/'$user'/'$repo'/dispatches' \
    --header 'authorization: Bearer '$token \
    --data '{"event_type": "hello", "client_payload": {"message": {"foo": "bar"}}}'
