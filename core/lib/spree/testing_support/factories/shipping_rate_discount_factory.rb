# frozen_string_literal: true

FactoryBot.define do
  factory :shipping_rate_discount, class: Spree::ShippingRateDiscount do
    shipping_rate
    amount { BigDecimal("2.50") }
    label { "Discount for large order" }
    eligible { true }
  end
end
