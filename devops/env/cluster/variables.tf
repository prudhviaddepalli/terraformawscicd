variable "environment" {
    type = string
    description = "environment id"
}

variable "network_id" {
    type = string
    description = "network id for the cluster"
}

variable "cluster_name" {
    type = string
    description = "Name of the new cluster"
}

variable "cluster_availability" {
    type = string
    description = "cluster availability either SINGLE_ZONE or MULTI_ZONE"
}

variable "ckus" {
    type = string
    description = "number of CKU's minimum 2 if MULTI_ZONE"
}
