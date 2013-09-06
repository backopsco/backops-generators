  it 'destroy action should destroy model and redirect to index action' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    delete :destroy, id: <%= instance_name %>.id
    expect(response).to redirect_to(<%= items_url %>)
    <%= class_name %>.exists?(<%= instance_name %>.id).should be_false
    <%= class_name %>.find(<%= instance_name %>.id).active.should be_false
  end
