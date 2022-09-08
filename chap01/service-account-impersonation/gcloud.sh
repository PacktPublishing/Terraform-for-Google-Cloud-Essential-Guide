# Delete unused credentials locally 
unset GOOGLE_CREDENTIALS  

# Delete previously issued keys
rm ~/.terraform.json
gcloud iam service-accounts keys list    --iam-account=$GOOGLE_SERVICE_ACCOUNT
gcloud iam service-accounts keys delete   <SERVICE ACCOUNT ID>  --iam-account=$GOOGLE_SERVICE_ACCOUNT

# Set up impersonation 
export GOOGLE_IMPERSONATE_SERVICE_ACCOUNT=`gcloud iam service-accounts list --format="value(email)"  --filter=name:terraform`  

gcloud auth application-default login --no-launch-browser 

export USER_ACCOUNT_ID=`gcloud config get core/account` 

gcloud iam service-accounts add-iam-policy-binding \
    $GOOGLE_IMPERSONATE_SERVICE_ACCOUNT \
    --member="user:$USER_ACCOUNT_ID" \
    --role="roles/iam.serviceAccountTokenCreator"  

export GOOGLE_CLOUD_PROJECT=`gcloud info --format="value(config.project)"` 

