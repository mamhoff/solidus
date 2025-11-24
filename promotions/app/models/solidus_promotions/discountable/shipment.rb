module SolidusPromotions
  module Discountable
    class Shipment < SimpleDelegator
      include SolidusPromotions::DiscountableAmount

      def shipping_rates
        @shipping_rates ||= __getobj__.shipping_rates.map { Shipment.new(_1) }
      end

      delegate :current_lane, to: :order
    end
  end
end
