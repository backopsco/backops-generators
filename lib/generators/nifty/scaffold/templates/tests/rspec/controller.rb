require  'spec_helper'

describe <%= plural_class_name %>Controller do
  render_views

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  <%= controller_methods 'tests/rspec/actions' %>
end
