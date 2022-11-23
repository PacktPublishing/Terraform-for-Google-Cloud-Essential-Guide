gcloud services enable cloudasset.googleapis.com
sudo apt-get install google-cloud-sdk-config-connector

gcloud compute instances create myinstance --zone=us-central1-a
gcloud compute instances describe myinstance

terraform import  google_compute_instance.myinstance  \
//compute.googleapis.com/projects/<PROJECT_ID>/zones/us-central1-a/instances/myinstance

gcloud beta resource-config bulk-export \
  --resource-types=ComputeInstance \
  --project=<PROJECT_ID>  \
  --resource-format=terraform > import.tf


gcloud beta resource-config bulk-export \
  --resource-types=StorageBucket \
  --project=<PROJECT_ID>  \
  --resource-format=terraform > bucket.tf


gcloud beta resource-config bulk-export \
  --path=gke-out \
  --project=<PROJECT_ID> \
  --resource-format=terraform


  gcloud container clusters create-auto mycluster \
    --region=us-central1

 gcloud beta resource-config bulk-export  --project=<PROJECT_ID> \
  --path=gke-out   --resource-format=terraform    