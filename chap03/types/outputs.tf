output "number" {
  value = var.number
}

output "string" {
  value = var.string
}

output "boolean" {
  value = var.bool
}

output "list" {
  value = var.list
}

output "splat" {
  value = var.list[*]
}

output "list_element" {
  value = var.list[1]
}

output "map" {
  value = var.map
}

output "map_element" {
  value = var.map.us-west1
}

output "nested_map_element" {
  value = var.nested_map.apac
}

output "object" {
  value = var.object
}

output "object_element" {
  value = var.object.name
}