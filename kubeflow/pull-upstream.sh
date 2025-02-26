#!/usr/bin/env bash
#
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

export KUBEFLOW_MANIFESTS_VERSION=v1.4.0-rc.0
export KUBEFLOW_MANIFESTS_REPO=https://github.com/kubeflow/manifests.git

# Pull Kubeflow Pipelines upstream manifests.
./apps/pipelines/pull-upstream.sh

# apps/ related manifest
if [ -d apps/admission-webhook/upstream ]; then
    rm -rf apps/admission-webhook/upstream
fi
mkdir -p apps/admission-webhook
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/admission-webhook/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/admission-webhook

if [ -d apps/centraldashboard/upstream ]; then
    rm -rf apps/centraldashboard/upstream
fi
mkdir -p apps/centraldashboard
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/centraldashboard/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/centraldashboard

if [ -d apps/jupyter/jupyter-web-app/upstream ]; then
    rm -rf apps/jupyter/jupyter-web-app/upstream
fi
mkdir -p apps/jupyter/jupyter-web-app
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/jupyter/jupyter-web-app/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/jupyter/jupyter-web-app

if [ -d apps/jupyter/notebook-controller/upstream ]; then
    rm -rf apps/jupyter/notebook-controller/upstream
fi
mkdir -p apps/jupyter/notebook-controller
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/jupyter/notebook-controller/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/jupyter/notebook-controller

if [ -d apps/profiles/upstream ]; then
    rm -rf apps/profiles/upstream
fi
mkdir -p apps/profiles
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/profiles/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/profiles

if [ -d apps/training-operator/upstream ]; then
    rm -rf apps/training-operator/upstream
fi
mkdir -p apps/training-operator
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/training-operator/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/training-operator

if [ -d apps/kfserving/upstream ]; then
    rm -rf apps/kfserving/upstream
fi
mkdir -p apps/kfserving
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/kfserving/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/kfserving

if [ -d apps/katib/upstream ]; then
    rm -rf apps/katib/upstream
fi
mkdir -p apps/katib
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/katib/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/katib

if [ -d apps/volumes-web-app/upstream ]; then
    rm -rf apps/volumes-web-app/upstream
fi
mkdir -p apps/volumes-web-app
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/volumes-web-app/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/volumes-web-app

if [ -d apps/tensorboard/tensorboards-web-app/upstream ]; then
    rm -rf apps/tensorboard/tensorboards-web-app/upstream
fi
mkdir -p apps/tensorboard/tensorboards-web-app
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/tensorboard/tensorboards-web-app/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/tensorboard/tensorboards-web-app

if [ -d apps/tensorboard/tensorboard-controller/upstream ]; then
    rm -rf apps/tensorboard/tensorboard-controller/upstream
fi
mkdir -p apps/tensorboard/tensorboard-controller
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/apps/tensorboard/tensorboard-controller/upstream@${KUBEFLOW_MANIFESTS_VERSION}" apps/tensorboard/tensorboard-controller

# common/ related manifest
if [ -d common/kubeflow-namespace/upstream ]; then
    rm -rf common/kubeflow-namespace/upstream
fi
mkdir -p common/kubeflow-namespace
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/common/kubeflow-namespace/@${KUBEFLOW_MANIFESTS_VERSION}" common/kubeflow-namespace/upstream/

if [ -d common/istio/upstream/ ]; then
    rm -rf common/istio/upstream/
fi
mkdir -p common/istio
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/common/istio-1-9/@${KUBEFLOW_MANIFESTS_VERSION}" common/istio/upstream/

if [ -d common/cert-manager/upstream/ ]; then
    rm -rf common/cert-manager/upstream/
fi
mkdir -p common/cert-manager
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/common/cert-manager/@${KUBEFLOW_MANIFESTS_VERSION}" common/cert-manager/upstream/

if [ -d common/kubeflow-roles/upstream/ ]; then
    rm -rf common/kubeflow-roles/upstream/
fi
mkdir -p common/kubeflow-roles
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/common/kubeflow-roles/@${KUBEFLOW_MANIFESTS_VERSION}" common/kubeflow-roles/upstream/

if [ -d common/knative/upstream/ ]; then
    rm -rf common/knative/upstream/
fi
mkdir -p common/knative
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/common/knative/@${KUBEFLOW_MANIFESTS_VERSION}" common/knative/upstream/

if [ -d common/user-namespace/upstream ]; then
    rm -rf common/user-namespace/upstream
fi
mkdir -p common/user-namespace
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/common/user-namespace/@${KUBEFLOW_MANIFESTS_VERSION}" common/user-namespace/upstream/

# contrib/ related manifest
if [ -d contrib/application/upstream/ ]; then
    rm -rf contrib/application/upstream/
fi
mkdir -p contrib/application
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/contrib/application/@${KUBEFLOW_MANIFESTS_VERSION}" contrib/application/upstream/

if [ -d contrib/metacontroller/upstream/ ]; then
    rm -rf contrib/metacontroller/upstream/
fi
mkdir -p contrib/metacontroller
kpt pkg get "${KUBEFLOW_MANIFESTS_REPO}/contrib/metacontroller/@${KUBEFLOW_MANIFESTS_VERSION}" contrib/metacontroller/upstream/
