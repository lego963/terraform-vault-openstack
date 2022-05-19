data "openstack_images_image_v2" "ubuntu" {
  name        = "Standard_Ubuntu_20.04_latest"
  most_recent = true
}

output "ubuntu_image_id" {
  value = data.openstack_images_image_v2.ubuntu.id
}
