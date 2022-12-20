gsutil mb gs://$GOOGLE_CLOUD_PROJECT-tf-state
gsutil versioning set on gs://$GOOGLE_CLOUD_PROJECT-tf-state

gcloud services enable iamcredentials.googleapis.com
