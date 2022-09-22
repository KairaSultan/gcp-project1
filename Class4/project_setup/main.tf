data "google_billing_account" "acct" {
  display_name = "My Billing Account"
  open         = true
}

output  id {
    value = data.google_billing_account.acct.id
}

output  name {
    value = data.google_billing_account.acct.name
}