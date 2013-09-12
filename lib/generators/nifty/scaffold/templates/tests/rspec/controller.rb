require  'spec_helper'

describe <%= plural_class_name %>Controller do
  render_views

  before do
    controller.stub(:user_has_permission?) { true }
    @user = FactoryGirl.create(:controller)
    sign_in @user
  end

  <%= controller_methods 'tests/rspec/actions' %>
end
