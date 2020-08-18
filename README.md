# Horrendous thing that probably nobody should use

I just did it because I could

basically it uses terraform to apply a kustomization

Like really really, do not use this.

```bash
cd ./deploy_app
terraform init
```

```
$ terraform apply -auto-approve
module.kustomize.null_resource.name: Refreshing state... [id=7316211716008469756]
module.kustomize.data.null_data_source.checksum: Reading...
module.kustomize.null_resource.name: Destroying... [id=7316211716008469756]
module.kustomize.null_resource.name: Destruction complete after 0s
module.kustomize.data.null_data_source.checksum: Read complete after 0s [id=static]
module.kustomize.null_resource.name: Creating...
module.kustomize.null_resource.name: Provisioning with 'local-exec'...
module.kustomize.null_resource.name (local-exec): Executing: ["/bin/sh" "-c" "set -o errexit\ncd ../kustomize/base\n\nkustomize edit set namespace \"myapp\"\n\nkustomize edit set nameprefix \"myapp-\"\n\nkustomize edit set image image=docker.io/nginx:1.19.2-alpine\n\nkustomize build .\n"]
module.kustomize.null_resource.name (local-exec): apiVersion: v1
module.kustomize.null_resource.name (local-exec): kind: Service
module.kustomize.null_resource.name (local-exec): metadata:
module.kustomize.null_resource.name (local-exec):   labels:
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/instance: nexus
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/managed-by: Kustomize
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/name: release
module.kustomize.null_resource.name (local-exec):   name: myapp-release
module.kustomize.null_resource.name (local-exec):   namespace: myapp
module.kustomize.null_resource.name (local-exec): spec:
module.kustomize.null_resource.name (local-exec):   ports:
module.kustomize.null_resource.name (local-exec):   - name: http
module.kustomize.null_resource.name (local-exec):     port: 80
module.kustomize.null_resource.name (local-exec):     protocol: TCP
module.kustomize.null_resource.name (local-exec):   selector:
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/instance: instance
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/name: release
module.kustomize.null_resource.name (local-exec): ---
module.kustomize.null_resource.name (local-exec): apiVersion: apps/v1
module.kustomize.null_resource.name (local-exec): kind: Deployment
module.kustomize.null_resource.name (local-exec): metadata:
module.kustomize.null_resource.name (local-exec):   labels:
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/instance: instance
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/managed-by: Terraform Kustomize
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/name: release
module.kustomize.null_resource.name (local-exec):   name: myapp-release
module.kustomize.null_resource.name (local-exec):   namespace: myapp
module.kustomize.null_resource.name (local-exec): spec:
module.kustomize.null_resource.name (local-exec):   replicas: 1
module.kustomize.null_resource.name (local-exec):   selector:
module.kustomize.null_resource.name (local-exec):     matchLabels:
module.kustomize.null_resource.name (local-exec):       app.kubernetes.io/instance: instance
module.kustomize.null_resource.name (local-exec):       app.kubernetes.io/name: release
module.kustomize.null_resource.name (local-exec):   strategy:
module.kustomize.null_resource.name (local-exec):     type: Recreate
module.kustomize.null_resource.name (local-exec):   template:
module.kustomize.null_resource.name (local-exec):     metadata:
module.kustomize.null_resource.name (local-exec):       labels:
module.kustomize.null_resource.name (local-exec):         app.kubernetes.io/instance: instance
module.kustomize.null_resource.name (local-exec):         app.kubernetes.io/name: release
module.kustomize.null_resource.name (local-exec):     spec:
module.kustomize.null_resource.name (local-exec):       containers:
module.kustomize.null_resource.name (local-exec):       - image: docker.io/nginx:1.19.2-alpine
module.kustomize.null_resource.name (local-exec):         imagePullPolicy: Always
module.kustomize.null_resource.name (local-exec):         livenessProbe:
module.kustomize.null_resource.name (local-exec):           failureThreshold: 6
module.kustomize.null_resource.name (local-exec):           httpGet:
module.kustomize.null_resource.name (local-exec):             path: /
module.kustomize.null_resource.name (local-exec):             port: 80
module.kustomize.null_resource.name (local-exec):           initialDelaySeconds: 30
module.kustomize.null_resource.name (local-exec):           periodSeconds: 30
module.kustomize.null_resource.name (local-exec):         name: app
module.kustomize.null_resource.name (local-exec):         ports:
module.kustomize.null_resource.name (local-exec):         - containerPort: 80
module.kustomize.null_resource.name (local-exec):           name: http
module.kustomize.null_resource.name (local-exec):         readinessProbe:
module.kustomize.null_resource.name (local-exec):           failureThreshold: 6
module.kustomize.null_resource.name (local-exec):           httpGet:
module.kustomize.null_resource.name (local-exec):             path: /
module.kustomize.null_resource.name (local-exec):             port: 80
module.kustomize.null_resource.name (local-exec):           initialDelaySeconds: 30
module.kustomize.null_resource.name (local-exec):           periodSeconds: 30
module.kustomize.null_resource.name (local-exec):         resources:
module.kustomize.null_resource.name (local-exec):           limits:
module.kustomize.null_resource.name (local-exec):             cpu: 500m
module.kustomize.null_resource.name (local-exec):             memory: 512Mi
module.kustomize.null_resource.name (local-exec):           requests:
module.kustomize.null_resource.name (local-exec):             cpu: 200m
module.kustomize.null_resource.name (local-exec):             memory: 256Mi
module.kustomize.null_resource.name (local-exec): ---
module.kustomize.null_resource.name (local-exec): apiVersion: networking.k8s.io/v1beta1
module.kustomize.null_resource.name (local-exec): kind: Ingress
module.kustomize.null_resource.name (local-exec): metadata:
module.kustomize.null_resource.name (local-exec):   annotations:
module.kustomize.null_resource.name (local-exec):     kubernetes.io/ingress.class: nginx
module.kustomize.null_resource.name (local-exec):   labels:
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/instance: instance
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/managed-by: Kustomize
module.kustomize.null_resource.name (local-exec):     app.kubernetes.io/name: release
module.kustomize.null_resource.name (local-exec):   name: myapp-release
module.kustomize.null_resource.name (local-exec):   namespace: myapp
module.kustomize.null_resource.name (local-exec): spec:
module.kustomize.null_resource.name (local-exec):   rules:
module.kustomize.null_resource.name (local-exec):   - host: dummy.host
module.kustomize.null_resource.name (local-exec):     http:
module.kustomize.null_resource.name (local-exec):       paths:
module.kustomize.null_resource.name (local-exec):       - backend:
module.kustomize.null_resource.name (local-exec):           serviceName: myapp-release
module.kustomize.null_resource.name (local-exec):           servicePort: 80
module.kustomize.null_resource.name (local-exec):         path: /
module.kustomize.null_resource.name: Creation complete after 2s [id=5385805140259584223]
```
