# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spree::Adjustment do
  describe ".promotion" do
    let(:spree_promotion_action) { create(:promotion, :with_action).actions.first }
    let!(:spree_promotion_action_adjustment) { create(:adjustment, source: spree_promotion_action) }
    let(:friendly_promotion_action) { create(:friendly_promotion, :with_adjustable_action).actions.first }
    let!(:friendly_promotion_action_adjustment) { create(:adjustment, source: friendly_promotion_action) }
    let(:tax_rate) { create(:tax_rate) }
    let!(:tax_adjustment) { create(:adjustment, source: tax_rate) }

    subject { described_class.promotion }

    it { is_expected.to contain_exactly(friendly_promotion_action_adjustment, spree_promotion_action_adjustment) }
  end

  describe ".friendly_promotion" do
    let(:spree_promotion_action) { create(:promotion, :with_action).actions.first }
    let!(:spree_promotion_action_adjustment) { create(:adjustment, source: spree_promotion_action) }
    let(:friendly_promotion_action) { create(:friendly_promotion, :with_adjustable_action).actions.first }
    let!(:friendly_promotion_action_adjustment) { create(:adjustment, source: friendly_promotion_action) }
    let(:tax_rate) { create(:tax_rate) }
    let!(:tax_adjustment) { create(:adjustment, source: tax_rate) }

    subject { described_class.friendly_promotion }

    it { is_expected.to contain_exactly(friendly_promotion_action_adjustment) }
  end

  describe "#promotion?" do
    let(:source) { create(:friendly_promotion, :with_adjustable_action).actions.first }
    let!(:adjustment) { build(:adjustment, source: source) }

    subject { adjustment.promotion? }

    it { is_expected.to be true }

    context "with a Spree Promotion Action source" do
      let(:source) { create(:promotion, :with_action).actions.first }

      it { is_expected.to be true }
    end

    context "with a Tax Rate source" do
      let(:source) { create(:tax_rate) }

      it { is_expected.to be false }
    end
  end

  describe "#friendly_promotion?" do
    let(:source) { create(:friendly_promotion, :with_adjustable_action).actions.first }
    let!(:adjustment) { build(:adjustment, source: source) }

    subject { adjustment.friendly_promotion? }

    it { is_expected.to be true }

    context "with a Spree Promotion Action source" do
      let(:source) { create(:promotion, :with_action).actions.first }

      it { is_expected.to be false }
    end

    context "with a Tax Rate source" do
      let(:source) { create(:tax_rate) }

      it { is_expected.to be false }
    end
  end
end
