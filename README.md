# Implement Load Balancing on Compute Engine: Challenge Lab

This Terraform module can be used to deploy all the resources needed to complete this challenge.

# Usage

* Simply supply the correct values for the jumphost instance (bastion) and managed instance group (mig) in the terraform.tfvars file.
* Update the Google Cloud provider configuration in provider.tf and authenticate with Google Cloud boefore you can run terraform commands from the terraform folder to deploy the needed resoruces, for more information refer [here](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started)
* For more information, to set up a load balancer with a managed instance group, refer [here](https://cloud.google.com/load-balancing/docs/https/ext-https-lb-simple#configure_the_network_and_subnets_2)
