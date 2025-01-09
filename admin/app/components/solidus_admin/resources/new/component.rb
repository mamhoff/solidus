# frozen_string_literal: true

class SolidusAdmin::Resources::New::Component < SolidusAdmin::Resources::BaseComponent
  def initialize(resource, closable: true)
    super(resource)
    @closable = closable
  end

  def form_id
    dom_id(@resource, "#{stimulus_id}_new_#{resource_name}_form")
  end

  def form_url
    solidus_admin.send("#{plural_resource_name}_path", **search_filter_params)
  end

  def closable?
    @closable
  end
end
