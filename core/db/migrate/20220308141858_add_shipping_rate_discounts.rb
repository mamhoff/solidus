class AddShippingRateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_shipping_rate_discounts do |t|
      t.references :shipping_rate, index: true, foreign_key: { to_table: :spree_shipping_rates }
      t.string :label
      t.decimal :amount
      t.boolean :eligible
      t.timestamps
    end
  end
end
