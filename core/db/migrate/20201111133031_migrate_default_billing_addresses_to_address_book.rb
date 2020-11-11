# frozen_string_literal: true

class MigrateDefaultBillingAddressesToAddressBook < ActiveRecord::Migration[5.2]
  def up
    if Spree::UserAddress.where(default_billing: true).any?
      Rails.logger.info("This migration seems to have run before in this environment.")
      return true
    end

    adapter_type = connection.adapter_name.downcase.to_sym
    if adapter_type == :mysql2
      sql = <<~SQL
        UPDATE spree_user_addresses
        JOIN spree_users ON spree_user_addresses.user_id = spree_users.id
          AND spree_user_addresses.address_id = spree_users.bill_address_id
        SET spree_user_addresses.default_billing = true
      SQL
    else
      sql = <<~SQL
        UPDATE spree_user_addresses
        SET default_billing = true
        FROM spree_users
        WHERE spree_user_addresses.address_id = spree_users.bill_address_id
          AND spree_user_addresses.user_id = spree_users.id;
      SQL
    end
    execute sql
  end

  def down
    Spree::UserAddress.update_all(default_billing: false) # rubocop:disable Rails/SkipsModelValidations
  end
end
