gcloud services enable iamcredentials.googleapis.com

gcloud iam service-accounts create terraform \
    --description="Terraform Service Account" \
    --display-name="terraform"


gcloud auth login --no-launch-browser

export GOOGLE_SERVICE_ACCOUNT=`gcloud iam service-accounts list --format="value(email)"  --filter=name:terraform` 

export GOOGLE_CLOUD_PROJECT=`gcloud info --format="value(config.project)"`

gcloud iam service-accounts add-iam-policy-binding \
     $GOOGLE_SERVICE_ACCOUNT \
    --member="serviceAccount:$GOOGLE_SERVICE_ACCOUNT" \
    --role="roles/editor"

gcloud beta iam service-accounts keys create "./terraform.json"     --iam-account=$GOOGLE_SERVICE_ACCOUNT 
