# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Spree::ShippingRateDiscount do
  let(:discount) { build(:shipping_rate_discount) }

  it { is_expected.to respond_to(:shipping_rate) }
  it { is_expected.to have_attribute(:eligible) }
  it { is_expected.to have_attribute(:amount) }
  it { is_expected.to have_attribute(:label) }
end
