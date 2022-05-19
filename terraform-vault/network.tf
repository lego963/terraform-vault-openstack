data "openstack_networking_network_v2" "this" {
  name = "admin_external_net"
}

resource "openstack_networking_network_v2" "this" {
  name = "vault-network"
}

resource "openstack_networking_subnet_v2" "this" {
  name            = "vault-subnet"
  network_id      = openstack_networking_network_v2.this.id
  cidr            = "192.168.0.0/20"
  dns_nameservers = ["100.125.4.25", "100.125.129.199"]
}

resource "openstack_networking_router_v2" "this" {
  name                = "vault-router"
  external_network_id = data.openstack_networking_network_v2.this.id
  enable_snat         = true
  admin_state_up      = true
}

resource "openstack_networking_router_interface_v2" "this" {
  router_id = openstack_networking_router_v2.this.id
  subnet_id = openstack_networking_subnet_v2.this.id
}
