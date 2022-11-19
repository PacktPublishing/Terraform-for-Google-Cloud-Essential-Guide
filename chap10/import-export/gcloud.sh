gcloud services enable cloudasset.googleapis.com
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
