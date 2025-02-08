# 🚀 AWS IAM & EC2 Setup Guide

## 📌 Step 1: Set Up IAM User
1. Go to **AWS IAM Console**.
2. Create a new IAM user.
3. **Assign Permissions:**
   - ✅ EC2 Full Access
   - ✅ Administrator Access
4. **Copy & Save** the Access Key and Secret Key.

---

## 🔧 Step 2: Install AWS CLI
```bash
sudo snap install aws-cli
```

### 📌 Verify Installation:
```bash
aws --version
```

---

## 🔑 Step 3: Configure AWS Credentials
```bash
aws configure
```
Alternatively, export credentials manually:
```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_REGION="us-east-1"
```

---

## 🏗 Step 4: Create Terraform Configuration

### 📜 Define EC2 Instance (main.tf)
```terraform
vim main.tf
```
Paste the following:
```terraform
resource "aws_instance" "MyfirstInstance" {
  ami = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}
```

### 🌍 Define AWS Provider (providers.tf)
```terraform
vim providers.tf
```
Paste the following:
```terraform
provider "aws" {
  region = "us-east-1"
}
```

---

## 🚀 Step 5: Deploy with Terraform
```bash
terraform init
terraform plan
terraform apply
```

🎉 **Congratulations! Your EC2 instance is deployed.**


