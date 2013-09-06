require  'spec_helper'

describe <%= plural_class_name %>Controller do
  render_views

  <%= controller_methods 'tests/rspec/actions' %>
end
