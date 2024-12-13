variable "ami" {
    description = "ami for the instance"
    default = "ami-0ea3c35c5c3284d82" 
}
variable "ec2instancetype" {
  default = "t2.micro"
  description = "instance type for ec2 instance"
}
variable "tagname" {
    description = "tag for terraform file"
    default = "terra" 
}
variable "volumesize" {
  description = "rootblock volume size for ec2 instance"
  default="10"
  
}
variable "volumetype" {
  description = "root block volume type for ec2 instance"
  default="gp3"
  
}
