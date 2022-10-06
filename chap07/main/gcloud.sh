export SERVICE_ACCOUNT=`gcloud iam service-accounts list --format="value(email)"  --filter=name:cloudrun`

gcloud run deploy helloworld  --region us-central1   \
 --image gcr.io/terraform-for-gcp/helloworld:latest \
 --platform managed  --allow-unauthenticated  \
 --service-account $SERVICE_ACCOUNT \
 --ingress internal-and-cloud-load-balancing 


gcloud run deploy redis  --region us-central1   \
 --image gcr.io/terraform-for-gcp/redis:latest \
 --platform managed  --allow-unauthenticated  \
 --service-account $SERVICE_ACCOUNT \
 --ingress internal-and-cloud-load-balancing \
  --vpc-connector vpccon \
 --update-secrets=REDIS_IP=redis-ip:latest 
 

 gcloud run deploy my-hello --region us-central1   \
--image us-docker.pkg.dev/cloudrun/container/hello \
--platform managed --allow-unauthenticated \
--service-account $SERVICE_ACCOUNT \
--ingress internal-and-cloud-load-balancing