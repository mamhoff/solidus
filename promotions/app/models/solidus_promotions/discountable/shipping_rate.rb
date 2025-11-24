module SolidusPromotions
  module Discountable
    class ShippingRate < SimpleDelegator
      include SolidusPromotions::DiscountableAmount
    end
  end
end
