server_name = "dynamic-block"

disks = {
  small-disk  = { "type" : "pd-ssd", "size" : 10, "mode" : "READ_WRITE" },
  medium-disk = { "type" : "pd-balanced", "size" : 50, "mode" : "READ_WRITE" },
  large-disk  = { "type" : "pd-standard", "size" : 100, "mode" : "READ_ONLY" },
}
