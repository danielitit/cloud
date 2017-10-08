# HelloWorld Container

#Overview

The terraform script in this directory automate creation and configuration of a Kubernetes cluster, while .yaml scripts crate simple http containers with autoscaling configuration.


## Prerequisites

This example requires:
* Google Cloud Account
* Terraform
* Kubernetes (at least 1.7.5)

## Terraform configuration

In order to use terraform for creating Kubernetes cluster you have to create Authentication JSON file.

Authenticating with Google Cloud services requires a JSON file which we call the account file.

This file is downloaded directly from the [Google Developers Console](https://console.developers.google.com/). To make the process more straightforwarded, it is documented here:

1. Log into the [Google Developers Console](https://console.developers.google.com/) and select a project.

2. The API Manager view should be selected, click on "Credentials" on the left, then "Create credentials", and finally "Service account key".

3. Select "Compute Engine default service account" in the "Service account" dropdown, and select "JSON" as the key type.

4. Clicking "Create" will download your credentials.
