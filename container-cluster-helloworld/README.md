# HelloWorld Container

## Overview

The terraform script in this directory automate creation and configuration of a Kubernetes cluster, while .yaml scripts create simple http containers with autoscaling configuration.


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

5. After downloading credential file, you have to put it to terraform script directory and configure the the google cloud provider in the terraform script.

```

// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("$credential_filename")}"
  project     = "my-gce-project"
  region      = "us-central1"
}

```

## Creating Kubernetes cluster

1. terraform init inicjalizacja backendu cos tam cos tam

```

$ terraform init

```

2. terraform plan cos tam cos tam

```

$ terraform plan

```

3. terraform apply cos tam cos tam

```

$ terraform apply

```

## Performance Testing & High Availability & Distaster Recovery

To measure web application performance, load stress capacity and verify service scalability I would like to propose following tools:

### Basic Tools

1. [ab](http://httpd.apache.org/docs/current/programs/ab.html) - Apache HTTP server benchmarking tool. Using ab tools we can check how many requests per second our http server is capable of serving.

Example of usage:

```

$ ab -k -n 50000 -c 5 http://$URL/

-k
  Enable the HTTP KeepAlive feature, i.e., perform multiple requests within one HTTP session. Default is no KeepAlive.
-n
  Number of requests to perform for the benchmarking session. The default is to just perform a single request which usually leads to non-representative benchmarking results.
-c
  Number of multiple requests to perform at a time. Default is one request at a time.

```

2. Simple load generator command

```

$ while true; do wget -q -O- http://$URL; done

```

### Advanced Tools

1. [Apache JMeter](http://jmeter.apache.org/) - "pure Java application designed to load test functional behavior and measure performance."

2. [Taurus](https://github.com/Blazemeter/taurus) - "Hides the complexity of performance and functional tests with an automation-friendly convenience wrapper. Taurus relies on JMeter, Gatling, Locust.io, Grinder and Selenium WebDriver as its underlying tools. "


### Bonus HA&DR tool

1. [kube-monkey](https://github.com/asobti/kube-monkey) - "It randomly deletes Kubernetes pods in the cluster encouraging and validating the development of failure-resilient services."
