module "ssm" {
  source  = "./mod_ec2_instances"
  ssm_subnet_id = module.vpc.private_subnets[0]
  vpc_id = module.vpc.vpc_id
  name = local.name
  cidr_blocks = local.vpc_cidr
  ssm_ami = "ami-0a242269c4b530c5e"
}