provider "google" {
	credentials	= "${file("account.json")}"
	project		= "containers-cluster-181711"
	region		= "us-central1"
}

resource "google_container_cluster" "primary" {
	name			= "helloworld-cluster"
	zone			= "us-central1-a"
	initial_node_count	= 2

	master_auth {
		username = "yoda"
		password = "adoy"
	}

	node_config {
		machine_type = "n1-standard-1"
		disk_size_gb = "100"
		oauth_scopes = [
		"https://www.googleapis.com/auth/compute",
		"https://www.googleapis.com/auth/devstorage.read_only",

		]
	}

	addons_config {
		http_load_balancing {
			disabled = true
		}
		horizontal_pod_autoscaling {
			disabled = false
		}
	}
}
