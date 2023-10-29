provider "aws" {
    region = "us-west-2"
    profile = "personal" 
}

provider "google" {
  project = "multi-cloud-project"
  region = "us-central1"
  zone = "us-central1-c"
}

provider "azurerm" {
  features {
  }
}