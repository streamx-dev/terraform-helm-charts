# Copyright 2025 Dynamic Solutions Sp. z o.o. sp.k.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

locals {
  default_issuer_ingress_class    = "nginx"
  default_name                    = "letsencrypt-cert-cluster-issuer"
  default_namespace               = "cert-manager"
  default_prod_letsencrypt_server = false

  issuer_ingress_class    = var.force_defaults_for_null_variables && var.issuer_ingress_class == null ? local.default_issuer_ingress_class : var.issuer_ingress_class
  name                    = var.force_defaults_for_null_variables && var.name == null ? local.default_name : var.name
  namespace               = var.force_defaults_for_null_variables && var.namespace == null ? local.default_namespace : var.namespace
  prod_letsencrypt_server = var.force_defaults_for_null_variables && var.prod_letsencrypt_server == null ? local.default_prod_letsencrypt_server : var.prod_letsencrypt_server
}

resource "kubectl_manifest" "letsencrypt_cert_cluster_issuer" {
  force_new          = true
  override_namespace = local.namespace
  yaml_body          = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: ${local.name}
spec:
  acme:
    server: ${local.prod_letsencrypt_server ? "https://acme-v02.api.letsencrypt.org/directory" : "https://acme-staging-v02.api.letsencrypt.org/directory"}
    email: ${var.issuer_acme_email}
    privateKeySecretRef:
      name: ${local.name}-cluster-issuer-key
    solvers:
      - http01:
          ingress:
            ingressClassName: ${local.issuer_ingress_class}
YAML
}
