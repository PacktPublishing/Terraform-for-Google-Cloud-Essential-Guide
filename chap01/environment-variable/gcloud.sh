mkdir ~/.config/gcloud/ -p

mv ../key-file/terraform.json ~/.config/gcloud/terraform.json  
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/terraform.json  
