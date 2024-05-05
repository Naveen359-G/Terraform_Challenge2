# Terraform_Challenge2
# In this challenge we will implement a simple EC2 instance with some preinstalled packages.

- Utilize /root/terraform-challenges/project-citadel directory to store your Terraform configuration files.

# The requirements in detail :

- Amazon Web Services (AWS) provider have been configured already to interact with the many resources supported by AWS.
- Create a terraform key-pair citadel-key with key_name citadel.
Upload the public key ec2-connect-key.pub to the resource. 
You may use the file function to read the public key at /root/terraform-challenges/project-citadel/.ssh
- AMI: ami-06178cf087598769c, use variable named ami
Region: eu-west-2, use variable named region
Instance Type: m5.large, use variable named instance_type
------------------------------------------------------------------------------------------------------------------------------
Elastic IP address attached to the EC2 instance
------------------------------------------------------------------------------------------------------------------------------
- Create a local-exec provisioner for the eip resource and use it to print the attribute called public_dns
 to a file /root/citadel_public_dns.txt on the iac-server
------------------------------------------------------------------------------------------------------------------------------
- Install nginx on citadel instance, make use of the user_data argument.
Using the file function or by making use of the heredoc syntax, use the script called install-nginx.sh 
as the value for the user_data argument.
------------------------------------------------------------------------------------------------------------------------------

![Terraform task](https://private-user-images.githubusercontent.com/62663965/328040727-d67208ed-6ceb-46e4-951b-0306397efd86.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTQ5MzQ4MzAsIm5iZiI6MTcxNDkzNDUzMCwicGF0aCI6Ii82MjY2Mzk2NS8zMjgwNDA3MjctZDY3MjA4ZWQtNmNlYi00NmU0LTk1MWItMDMwNjM5N2VmZDg2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA1MDUlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwNTA1VDE4NDIxMFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTgwZGE5NzY1OTcyMGFmMmQ2MDVjOTQzZjJlNzAxM2IxMDVhMGU4YjEzOWIyMDBjNjBmODg0MmZkYmJjYzMwNTUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.Fakobcv9vOymLDmzz6Ky7Hi15ytz00FxU3k6AZNPhPI)

==============================================================================================================================

# Objective:
The objective of this task is to provision AWS resources using Terraform. 
Specifically, we aim to create an EC2 instance, allocate an Elastic IP, 
and associate it with the instance. Additionally, we'll create an AWS Key Pair for SSH access to the instance.

# Prerequisites:

AWS account credentials with appropriate permissions.
Terraform installed on your local machine.
Basic understanding of AWS services and Terraform concepts.
================================================================================================================================
Additonal details:

# terraform.tfvars

```JSON
ami            = "ami-06178cf087598769c"
instance_type  = "m5.large"
region         = "eu-west-2"
```
------------------------------------------------------------------------------------------------------------------------------
- Make sure in the correct directory:

```JSON
/root/terraform-challenges/project-citadel
```
- Write Terraform Configuration Files ( Check the repository for the files)

# Steps 1: Initialize Terraform:

```JSON
terraform init
```
This command initializes the current directory as a Terraform working directory and downloads the necessary provider plugins.

# Step 2: Validate Configuration:

```JSON
terraform validates
```
Validates the Terraform configuration files for any syntax errors or other issues.

# Step 3: Plan Deployment:
```JSON
terraform plan
```
Generates an execution plan, displaying Terraform's actions to create, modify, or delete resources.

# Step 5: Apply Configuration:
```JSON
terraform apply
```
Applies the changes required to reach the desired configuration state, creating the specified AWS resources.

- Once the apply command completes successfully, you can access the provisioned resources using the appropriate AWS services.


================================================================================================================================

# Step 6: Clean Up:

```BASH
terraform destroy
```

================================================================================================================================














