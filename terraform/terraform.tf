terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.25.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
  }
}