# frozen_string_literal: true

class Spree::ShippingRateDiscount < Spree::Base
  belongs_to :shipping_rate, class_name: "Spree::ShippingRate", inverse_of: :discounts, foreign_key: :shipping_rate_id
end
