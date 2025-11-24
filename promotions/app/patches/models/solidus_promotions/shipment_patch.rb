# frozen_string_literal: true

module SolidusPromotions
  module ShipmentPatch


    Spree::Shipment.prepend self
  end
end
