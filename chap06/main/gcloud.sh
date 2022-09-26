#!/bin/sh
gcloud secrets versions access latest --secret="db-user-pw"
echo "\n" 