resource "aws_key_pair" "my-terrakey" {
  key_name   = "${var.tagname}-key1"
  public_key = file("./terra-key1.pub ")

}
resource "aws_default_vpc" "default" {
  #default VPC
}
resource "aws_security_group" "my-sg1" {
  name        = "${var.tagname}-sg1"
  description = "this is a sg created by terraform"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "allow access to ssh from ec2 with port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow http access from ec2 with port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "all out going access"
    to_port     = 0
    from_port   = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name="${var.tagname}-sg2"
  }
}
resource "aws_instance" "my-instance" {
  ami = var.ami
  key_name = aws_key_pair.my-terrakey.key_name #Interpolation
  security_groups = [aws_security_group.my-sg1.name] #Interpolation
  instance_type   = var.ec2instancetype
  root_block_device {
    volume_size = var.volumesize
    volume_type = var.volumetype
  }
  tags = {
    Name = "${var.tagname}-instance"
  }

}
