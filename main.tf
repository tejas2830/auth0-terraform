resource "auth0_client" "terraform-client" {
  name                = "Terraform demo App"
  description         = "App for configuring application via Terraform"
  app_type            = "regular_web"
  callbacks           = ["http://localhost:3000/callback"]
  oidc_conformant     = true
  web_origins         = ["http://localhost:3000"]
  allowed_logout_urls = ["http://localhost:3000"]
  initiate_login_uri  = "https://login.microsoftonline.com/13af8d65-0b4b-4c0f-a446-a427419abfd6/saml2"

  cross_origin_auth = true
  grant_types = [
    "authorization_code",
    "refresh_token",
    "client_credentials"
  ]
  jwt_configuration {
    lifetime_in_seconds = 300
    secret_encoded      = true
    alg                 = "RS256"
    scopes = {
      foo = "bar"
    }
  }
  refresh_token {
    leeway          = 0
    token_lifetime  = 2592000
    rotation_type   = "rotating"
    expiration_type = "expiring"
  }
  addons {
    samlp {
      audience = "https://example.com/saml"
      issuer   = "https://example.com"
      mappings = {
        email = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"
        name  = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
      }
      create_upn_claim                   = false
      passthrough_claims_with_no_mapping = false
      map_unknown_claims_as_is           = false
      map_identities                     = false
      name_identifier_format             = "urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"
      name_identifier_probes = [
        "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"
      ]
      #signing_cert = "-----BEGIN PUBLIC KEY-----\nMIGf...bpP/t3\n+JGNGIRMj1hF1rnb6QIDAQAB\n-----END PUBLIC KEY-----\n"
      #      signing_key {
      #        key  = "-----BEGIN PRIVATE KEY-----\nMIGf...bpP/t3\n+JGNGIRMj1hF1rnb6QIDAQAB\n-----END PUBLIC KEY-----\n"
      #        cert = "-----BEGIN PUBLIC KEY-----\nMIGf...bpP/t3\n+JGNGIRMj1hF1rnb6QIDAQAB\n-----END PUBLIC KEY-----\n"
      #      }
    }
  }