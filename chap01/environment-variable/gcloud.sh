#!/bin/bash
export GOOGLE_CREDENTIALS=`cat ../key-file/terraform.json`
export GOOGLE_CLOUD_PROJECT=`gcloud info --format="value(config.project)"`
