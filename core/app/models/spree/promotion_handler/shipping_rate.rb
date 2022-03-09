# frozen_string_literal: true

module Spree
  module PromotionHandler
    class ShippingRate
      attr_reader :order
      attr_reader :promotions

      def initialize(order:)
        @order = order
        @promotions = get_promotions
      end

      def activate(shipping_rate)
        promotions.each do |promotion|
          promotion.activate(shipping_rate) if promotion.eligible?(shipping_rate)
        end
      end

      private

      def get_promotions
        order.promotions.select(&:active?) | active_shipping_promotions
      end

      def active_shipping_promotions
        Spree::Promotion.all.
          active.
          joins(:promotion_actions).
          merge(Spree::PromotionAction.shipping).to_a
      end
    end
  end
end
