locals {
  name   = "wcc-${replace(basename(path.cwd), "_", "-")}"
  region = "eu-west-2"
  environment = replace(basename(path.cwd), "_", "-")
  vpc_cidr = "172.18.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
      GithubOrg  = "bubblr-inc"    
  }
}
