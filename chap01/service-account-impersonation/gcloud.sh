unset GOOGLE_APPLICATION_CREDENTIALS
rm ~/.config/gcloud/terraform.json

export GOOGLE_IMPERSONATE_SERVICE_ACCOUNT=$GOOGLE_SERVICE_ACCOUNT

gcloud beta auth application-default login --no-launch-browser

gcloud iam service-accounts add-iam-policy-binding \
    $GOOGLE_SERVICE_ACCOUNT \
    --member="user:<YOUR EMAIL ADDRESS>" \
    --role="roles/iam.serviceAccountTokenCreator"

gcloud iam service-accounts keys list    --iam-account=$GOOGLE_SERVICE_ACCOUNT

gcloud iam service-accounts keys delete   <SERVICE ACCOUNT ID>  --iam-account=$GOOGLE_SERVICE_ACCOUNT
