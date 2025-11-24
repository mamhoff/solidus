module SolidusPromotions
  module Discountable
    class LineItem < SimpleDelegator
      include SolidusPromotions::DiscountableAmount
    end
  end
end
