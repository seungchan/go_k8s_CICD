variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "The name of the key-pair used to access the EC2 instances"
  type        = string
  default     = "ben"
}
