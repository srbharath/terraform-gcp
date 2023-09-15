provider "google" {
  project = "imposing-voyage-392509"
}

terraform {
	required_providers {
		google = {
	    version = "~> 4.60.0"
		}
  }
}
