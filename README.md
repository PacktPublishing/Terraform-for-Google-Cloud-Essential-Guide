# Terraform for Google Cloud Essential Guide

This is the code repository for [Terraform for Google Cloud Essential Guide], published by Packt.

## What is this book about?


## Instructions and Navigations
All of the code is organized into folders and subfolders corresponding to each chapter. For example, <code>chap02/count</code> is the code for Chapter 2, section The count meta-argument

You will have to replace the string <code>\<PROJECT-ID\></code> with the project id of your Google Cloud Project. To faciliate that, we have included a small <code>bash</code> script sets the Google Cloud project recursively.
 
```
./set-poject-id causal-calculus-366901
```
replaces all occurances of <code>\<PROJECT-ID\></code> in all files to <code>causal-calculus-366901</code>. Whereas the <code>-u</code> flag undoes the replacement, that is replacing all occurances back  <code>\<PROJECT-ID\></code>

```
./set-poject-id -u causal-calculus-366901
```
replaces all occurances of <code>causal-calculus-366901</code>  in all files to <code>\<PROJECT-ID\></code>

Besides the Terraform code, the code also includes a number of <code>gcloud</code> and Shell commands that we use for the exercises. We included those in the files entitled <code>gcloud.sh</code>. It best to copy and then paste the comands into your shell.

## Get to Know the Author
**Bernd Nordhausen**
is a seasoned cloud architect with over 25 years of experience working with industry leaders such as Intel and Accenture. He is a Google cloud authorized trainer and holds over a dozen cloud certifications from all three major cloud service providers. Currently working as an independent cloud consultant and Google Cloud trainer, Bernd was previously the technical lead for the Google Cloud practice at Accenture Southeast Asia. In that role, he developed and implemented several large-scale deployments on Google Cloud using Terraform. When his head is not in the cloud, Bernd is an aspiring wood worker and trail runner. 