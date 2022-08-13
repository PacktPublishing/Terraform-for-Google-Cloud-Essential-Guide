# variable "attached_disks" {
#   default = {
#     disk1 = { "name" : "small-disk", "type" : "pd-ssd", "size" : 10, "mode" : "READ_WRITE" },
#     disk2 = { "name" : "medium-disk", "type" : "pd-ssd", "size" : 50, "mode" : "READ_WRITE" },
#     disk3 = { "name" : "large-disk", "type" : "pd-ssd", "size" : 100, "mode" : "READ_ONLY" },
#   }
# }


# resource "google_compute_disk" "this" {
#   for_each = var.attached_disks
#   name     = each.value["name"]
#   type     = each.value["type"]
#   size     = each.value["size"]
#   zone     = var.zone
# }

# # resource "google_compute_subnetwork" "this" {
# #   depends_on               = [resource.google_compute_network.this]
# #   for_each                 = var.subnets
# #   network                  = var.network
# #   name                     = each.key
# #   region                   = each.value["region"]
# #   ip_cidr_range            = each.value["ip_cidr_range"]
# #   private_ip_google_access = "true"
# # }
