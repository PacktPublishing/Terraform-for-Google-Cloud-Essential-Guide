mkdir ~/.config/gcloud/ -p

mv ../key-file/terraform.json ~/.terraform.json  
export GOOGLE_APPLICATION_CREDENTIALS=~/./terraform.json  
