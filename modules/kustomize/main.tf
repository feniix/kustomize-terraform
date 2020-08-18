provider "aws" {
  region = "us-east-1"
}

data "null_data_source" "checksum" {
  # TODO: this hack will force trigger the null resource
  inputs = {
    checksum = md5(timestamp())
  }
}

variable "kustomization_source" {}

variable "kustomization_image_repo" {}

variable "kustomization_image_tag" {}

variable "kustomization_release_name" {}

variable "kustomization_namespace" {}

resource "null_resource" "name" {
  triggers = {
    "key" = data.null_data_source.checksum.outputs["checksum"]
  }
  provisioner "local-exec" {
    command = <<-CMD
    set -o errexit
    cd ${var.kustomization_source}

    kustomize edit set namespace ${var.kustomization_namespace}

    kustomize edit set nameprefix ${var.kustomization_release_name}

    kustomize edit set image image=${var.kustomization_image_repo}:${var.kustomization_image_tag}

    kustomize build .
CMD
  }
}