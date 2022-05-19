terraform {
  required_version = ">= 1.0.0"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }

    tls = {
      version = ">=3.0.0"
    }
  }
}

provider "openstack" {
  cloud = "tf"
}
