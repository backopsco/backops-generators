require File.dirname(__FILE__) + '/../spec_helper'

describe <%= class_name %> do
  it "should be valid" do
    expect(<%= class_name %>.new).to be_valid
  end
end
