#!/bin/bash

PACKAGE_VERSION="v7"

cat >Package.yaml <<EOL
apiVersion: package-operator.run/v1alpha1
kind: ClusterPackage
metadata:
  name: cert-manager-operator
spec:
  image: quay.io/apahim/cert-manager-operator-package:$PACKAGE_VERSION
EOL

kubectl package build -t quay.io/apahim/cert-manager-operator-package:$PACKAGE_VERSION --push resources/
