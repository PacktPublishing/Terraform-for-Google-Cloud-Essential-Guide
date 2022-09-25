variable "string" {
  type = string
}

variable "number" {
  type = number
}

variable "bool" {
  type = bool
}

variable "list" {
  type = list(any)
}

variable "map" {
  type = map(any)
}

variable "nested_map" {
  type = any
}

variable "object" {
  type = object({
    name     = string
    location = string
    regions  = list(string)
  })
}
