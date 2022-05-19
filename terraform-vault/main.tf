data "openstack_images_image_v2" "this" {
  name        = var.image_name
  most_recent = true
}
