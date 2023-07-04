# frozen_string_literal: true

require 'spec_helper'

RSpec.describe "Friendly Factories" do
  it "has a bunch of working factories" do
    [
      :friendly_promotion,
      :friendly_promotion_with_action_adjustment,
      :friendly_promotion_with_first_order_rule,
      :friendly_promotion_with_item_adjustment,
      :friendly_promotion_with_item_total_rule,
      :friendly_promotion_with_order_adjustment
    ].each do |factory|
      expect { FactoryBot.create(factory) }.not_to raise_exception
    end
  end
end
