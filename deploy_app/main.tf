module "kustomize" {
  source = "../modules/kustomize"
  kustomization_source = "../kustomize/base"

  kustomization_image_repo = "docker.io/nginx"
  kustomization_image_tag = "1.19.2-alpine"
  kustomization_release_name = "myapp"
  kustomization_namespace = "myapp"
}
