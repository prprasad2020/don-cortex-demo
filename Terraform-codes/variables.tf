variable "global_tags" {
  description = "Required map(string)"
  type        = map(string)
  default = {
    "name"        = "cortex-demo"
    "envName"        = "test"
    "managedBy"      = "Terraform"
  }
}

variable "cluster_name" {
  type        = string
  description = "Required (string): The name of the cortex EKS cluster"
  default     = "cortex-demo-eks"
}

variable "namespace" {
  type        = string
  description = "Required (string): The namespace containing the cortex pod"
  default     = "cortex"
}

variable "serviceaccount" {
  type        = string
  description = "Required (string): The name of the service account for the cortex pod"
  default     = "cortex"
}
