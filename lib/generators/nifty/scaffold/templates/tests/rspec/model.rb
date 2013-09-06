require  'spec_helper'

describe <%= class_name %> do
  context 'a valid instance' do
    it 'should be valid' do
      expect(<%= class_name %>.new).to be_valid
    end
  end
end
