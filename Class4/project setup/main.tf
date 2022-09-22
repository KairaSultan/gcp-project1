data "google_billing_account" "acct" {
  display_name = "My Billing Account"
  open         = true
}
output "id" {
  value = data.google_billing_account.acct.id
}

output "name" {
  value = data.google_billing_account.acct.name
}

output "display_name" {
  value = data.google_billing_account.acct.display_name
}

resource "random_password" "password" {
  length  = 16
  number  = false
  special = false
  lower   = true
  upper   = false
}


resource "google_project" "gcp-project-team3" {
  name            = "gcp-project-team3"
  project_id      = random_password.password.result
  billing_account = data.google_billing_account.acct.id
}

output "project_id" {
  value = google_project.gcp-project-team3.id
}

resource "null_resource" "set-project" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "gcloud config set project ${google_project.gcp-project-team3.id}"
  }
}