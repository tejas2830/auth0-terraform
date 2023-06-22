terraform {
  required_providers {
    auth0 = {
      source = "auth0/auth0"
      version = "0.49.0"
    }
  }
}

provider "auth0" {
  domain        = "dev-55iyt1m2fjlfi0dv.us.auth0.com"
  client_id     = "A2beQNXMg46gwK9Zc5YdPTTI8scgAJgN"
  client_secret = "72AK26SUgNL9bqVEX1VxFfDDqqlxms0xJuARlKl79Lcb_0eUc_Dd6NkN7U35_Qc_"
  #  debug         = "True"
}
