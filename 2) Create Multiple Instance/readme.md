# Terraform Configuration: Create Multiple EC2 Instances

This Terraform configuration creates **3 EC2 instances** in AWS using the `aws_instance` resource. Each instance is tagged with a unique name, and the public IP addresses of all instances are outputted.

## Code

```hcl
# Create 3 EC2 instances
resource "aws_instance" "MyfirstInstance" {
  count         = 3
  ami           = "ami-04b4f1a9cf54c11d0" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"              # Instance type (free-tier eligible)

  tags = {
    Name = "instance-${count.index}" # Unique name for each instance
  }
}

# Output the public IP addresses of all instances
output "instance_public_ips" {
  value = aws_instance.MyfirstInstance[*].public_ip
}
```

---

## Explanation

### 1. **Resource Block: `aws_instance`**
- **`count = 3`**: Creates **3 identical EC2 instances**.
- **`ami`**: Specifies the Amazon Machine Image (AMI) ID. Replace `"ami-04b4f1a9cf54c11d0"` with a valid AMI ID for your region.
- **`instance_type`**: Specifies the instance type. Here, `t2.micro` is used (free-tier eligible).
- **`tags`**: Assigns tags to each instance. The `Name` tag includes `${count.index}`, which ensures each instance has a unique name (e.g., `instance-0`, `instance-1`, `instance-2`).

### 2. **Output Block: `instance_public_ips`**
- **`value = aws_instance.MyfirstInstance[*].public_ip`**: Outputs the public IP addresses of all instances using the **splat expression** (`[*]`). This collects the `public_ip` attribute from each instance created by the `count` meta-argument.

---

## How to Use

1. **Save the Configuration**:
   Save the code in a file named `main.tf`.

2. **Initialize Terraform**:
   Run the following command to initialize the working directory:
   ```bash
   terraform init
   ```

3. **Review the Execution Plan**:
   Run the following command to see what Terraform will do:
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**:
   Run the following command to create the EC2 instances:
   ```bash
   terraform apply
   ```

5. **View Outputs**:
   After the instances are created, Terraform will display the public IP addresses of all instances in the output.

---

## Example Output

After running `terraform apply`, you’ll see output similar to this:

```
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

instance_public_ips = [
  "54.123.45.67",
  "54.234.56.78",
  "54.345.67.89"
]
```

---

## Notes

- **AMI ID**: Replace `"ami-04b4f1a9cf54c11d0"` with a valid AMI ID for your region. You can find AMI IDs in the [AWS EC2 Console](https://console.aws.amazon.com/ec2/v2/home) or using the AWS CLI:
  ```bash
  aws ec2 describe-images --owners amazon --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" --query "Images[0].ImageId" --output text
  ```

- **Key Pair**: If you want to SSH into the instances, add the `key_name` argument to the `aws_instance` resource:
  ```hcl
  key_name = "your-key-pair-name" # Replace with your key pair name
  ```

- **Security Groups**: For production environments, consider adding security groups to control inbound and outbound traffic.

---

## Directory Structure

```
terraform-project/
├── main.tf
```



