# frozen_string_literal: true

class Spree::Base < ActiveRecord::Base
  include Spree::Preferences::Preferable
  include Spree::Core::Permalinks
  include Spree::RansackableAttributes

  def initialize_preference_defaults
    if has_attribute?(:preferences)
      self.preferences = default_preferences.merge(preferences)
    end
  end

  self.abstract_class = true

  # Provides a scope that should be included any time products
  # are fetched with the intention of displaying to the user.
  #
  # Allows individual stores to include any active record scopes or joins
  # when products are displayed.
  def self.display_includes
    where(nil)
  end
end
