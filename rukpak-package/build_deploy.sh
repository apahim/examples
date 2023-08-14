#!/bin/bash

RUKPAK_IMAGE="rukpak:v0.13.0"
PACKAGE_VERSION="v6"

cat >Package.yaml <<EOL
apiVersion: package-operator.run/v1alpha1
kind: ClusterPackage
metadata:
  name: rukpak
spec:
  image: quay.io/apahim/rukpak-package:$PACKAGE_VERSION
  config:
    rukpakImage: "$RUKPAK_IMAGE"
EOL

kubectl package build -t quay.io/apahim/rukpak-package:$PACKAGE_VERSION --push package/
