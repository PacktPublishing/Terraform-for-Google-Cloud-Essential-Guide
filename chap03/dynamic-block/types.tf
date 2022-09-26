locals {
  string = "This is a string"
  number = 14
  bool   = true
  list   = ["us-west1", "us-west2"]
  map    = { us-west1 = "Oregon", us-west2 = "Los Angeles" }
  nested_map = {
    americas = ["us-west1", "us-west2"]
    apac     = ["asia-south1", "asia-southeast1"]
  }
}

output "number" {
  value = local.number
}

output "string" {
  value = local.string
}

output "boolean" {
  value = local.bool
}

output "list" {
  value = local.list
}

output "list_element" {
  value = local.list[1]
}

output "map" {
  value = local.map
}

output "map_element" {
  value = local.map.us-west1
}

output "nested_map_element" {
  value = local.nested_map.apac
}


variable "object" {
  type = object({
    name     = string
    location = string
    capacity = number
  })
}
