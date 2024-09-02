# frozen_string_literal: true

module SolidusPromotions
  class ConditionUser < Spree::Base
    belongs_to :condition, class_name: "SolidusPromotions::Condition", optional: true
    belongs_to :user, class_name: Spree::UserClassHandle.new, optional: true
  end
end
