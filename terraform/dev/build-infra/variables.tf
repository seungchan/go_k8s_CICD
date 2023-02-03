variable "ecr_name" {
  description = "The name of the ECR"
  type        = string
  default     = null
}

variable "image_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
  type        = string
  default     = "IMMUTABLE"
}

variable "tags" {
	description = "A map of tags to assign to the resource."
	type        = map(string)
	default     = {}
}