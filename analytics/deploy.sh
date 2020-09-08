#! /bin/bash

gcloud config set project diet-science-277400

PG_CONN=`gcloud secrets versions access --secret=diet-science-db-prod latest`

pipenv lock -r > requirements.txt

gcloud functions deploy interpolate-ts --entry-point run_process_data --runtime python37 \
    --trigger-topic interpolate-ts \
    --memory 2048MB \
    --max-instances 1 \
    --update-env-vars="PG_CONN=${PG_CONN}" \
    --timeout 540
