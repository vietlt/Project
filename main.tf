module "network" {
  source     = "./modules/network"
}

module "compute" {
  depends_on = [module.network]
  source     = "./modules/compute"
}

module "database" {
  depends_on = [module.network, module.compute]
  source     = "./modules/database"
}