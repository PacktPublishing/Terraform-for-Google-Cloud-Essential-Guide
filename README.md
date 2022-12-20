# Terraform for Google Cloud Essential Guide

<a href="https://www.packtpub.com/product/terraform-for-google-cloud-essential-guide/9781804619629?utm_source=github&utm_medium=repository&utm_campaign=9781804619629"><img src="https://static.packt-cdn.com/products/9781804619629/cover/smaller" alt="" height="256px" align="right"></a>

This is the code repository for [Terraform for Google Cloud Essential Guide](https://www.packtpub.com/product/terraform-for-google-cloud-essential-guide/9781804619629?utm_source=github&utm_medium=repository&utm_campaign=9781804619629), published by Packt.

**Learn how to provision infrastructure in Google Cloud securely and efficiently**

## What is this book about?
Google Cloud has adopted Terraform as the standard Infrastructure as Code tool. Thus, a good understanding of Terraform is essential for any cloud architect and engineer working on Google Cloud. 

In this book, we take you on a journey starting from the basic concepts to deploying complex architectures with Terraform. Using extensive code examples, we guide you on how to authenticate Terraform in Google Cloud, teach you all the essential concepts of the Terraform language as applied to Google Cloud, and deploy complete working architectures at a push of a button. 

This book covers the following exciting features:
* Multiple methods to authenticate Terraform in Google Cloud
* Writing efficient Terraform Code
* Using modules to share Terraform templates
* Managing multiple Environments in Google Cloud
* Applying Terraform to deploy multi-tiered architectures
* Using Public Modules to deploy complex architectures quickly
* Integrate Terraform into your Google Cloud Environment


If you feel this book is for you, get your [copy](https://www.amazon.com/dp/1804619620) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" 
alt="https://www.packtpub.com/" border="5" /></a>

## Instructions and Navigations

The code will look like the following:
```
output "public_ip_address" {
  value = var.static_ip ? google_compute_instance.this.network_interface.0.access_config.0.nat_ip : null
}
output "private_ip_address" {
  value = google_compute_instance.this.network_interface.0.network_ip
}
output "self_link" {
  value = google_compute_instance.this.self_link
}
```

All of the code is organized into folders and subfolders corresponding to each chapter. For example, <code>chap02/count</code> is the code for Chapter 2, section The count meta-argument

You will have to replace the string <code>\<PROJECT-ID\></code> with the project id of your Google Cloud Project. To faciliate that, we have included a small <code>bash</code> script sets the Google Cloud project recursively.
 
```
./set-project-id <PROJECT_ID>
```
replaces all occurances of <code>\<PROJECT-ID\></code> in all files to <code><PROJECT_ID></code>. Whereas the <code>-u</code> flag undoes the replacement, that is replacing all occurances back  <code>\<PROJECT-ID\></code>

```
./set-project-id -u <PROJECT_ID>
```
replaces all occurances of <code><PROJECT_ID></code>  in all files to <code>\<PROJECT-ID\></code>

Besides the Terraform code, the code also includes a number of <code>gcloud</code> and Shell commands that we use for the exercises. We included those in the files entitled <code>gcloud.sh</code>. It best to copy and then paste the comands into your shell.

**Following is what you need for this book:**
This book is for Google Cloud architects and engineers who want to increase their productivity by using Terraform to automate the provisioning of Google Cloud deployments. A basic understanding of Google Cloud, such as the ability to provision resources using the Google Cloud console and using Cloud Shell, is assumed. Certification in Google Cloud is not required but helpful.


We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://packt.link/yzxje).

### Related products
* The Ultimate Guide to Building a Google Cloud Foundation [[Packt]](https://www.packtpub.com/product/the-ultimate-guide-to-building-a-google-cloud-foundation/9781803240855?utm_source=github&utm_medium=repository&utm_campaign=9781803240855) [[Amazon]](https://www.amazon.com/dp/1803240857)

* Architecting Google Cloud Solutions [[Packt]](https://www.packtpub.com/product/architecting-google-cloud-solutions/9781800563308?utm_source=github&utm_medium=repository&utm_campaign=9781800563308) [[Amazon]](https://www.amazon.com/dp/1800563302)

## Get to Know the Author
**Bernd Nordhausen**
is a seasoned cloud architect with over 25 years of experience working with industry leaders such as Intel and Accenture. He is a Google cloud authorized trainer and holds over a dozen cloud certifications from all three major cloud service providers. Currently working as an independent cloud consultant and Google Cloud trainer, Bernd was previously the technical lead for the Google Cloud practice at Accenture Southeast Asia. In that role, he developed and implemented several large-scale deployments on Google Cloud using Terraform. When his head is not in the cloud, Bernd is an aspiring wood worker and trail runner.
