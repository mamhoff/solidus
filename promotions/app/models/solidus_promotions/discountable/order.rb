# frozen_string_literal: true

module SolidusPromotions
  module Discountable
    class Order < SimpleDelegator
      def line_items
        @line_items ||= __getobj__.line_items.map { SolidusPromotions::Discountable::LineItem.new(_1) }
      end

      def shipments
        @shipments ||= __getobj__.shipments.map { SolidusPromotions::Discountable::Shipment.new(_1) }
      end

      # This helper method excludes line items that are managed by an order benefit for the benefit
      # of calculators and benefits that discount normal line items. Line items that are managed by an
      # order benefits handle their discounts themselves.
      def discountable_line_items
        line_items.reject(&:managed_by_order_benefit)
      end
    end
  end
end
