Rails.configuration.stripe = {
  :publishable_key => "pk_test_BWU2ohVZ6qx5xtEUjzPOPK4b",
  :secret_key      => "sk_test_DljUrrwAAXK8BUB1QtBYSohu"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]