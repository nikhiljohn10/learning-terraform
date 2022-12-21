module "qa" {
    source = "../modules/blog"

    region = local.region
    environment = {
        name = "qa"
        network_prefix = "10.1"
    }
    max_size = 1
}
