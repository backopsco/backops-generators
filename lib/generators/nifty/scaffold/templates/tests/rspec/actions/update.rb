  it 'update action should render edit template when model is invalid' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    <%= class_name %>.any_instance.stub(:valid?) { false }
    put :update, id: <%= instance_name %>.id, <%= instance_name %>: <%= instance_name %>.attributes.reject {|k,v| ['id'].include?(k)}
    expect(response).to render_template(:edit)
  end

  it 'update action should redirect when model is valid' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    <%= class_name %>.any_instance.stub(:valid?) { true }
    put :update, id: <%= instance_name %>.id, <%= instance_name %>: <%= instance_name %>.attributes.reject {|k,v| ['id'].include?(k)}
    expect(response).to redirect_to(<%= item_path_for_spec('url') %>)
  end

<% if view_language == 'jbuilder' %>
  it 'update action should render edit template when model is invalid' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    <%= class_name %>.any_instance.stub(:valid?) { false }
    put :update, id: <%= instance_name %>.id, <%= instance_name %>: <%= instance_name %>.attributes.reject {|k,v| ['id'].include?(k)}, format: :json
    expect(response.status.to_i).to eq 400)
  end

  it 'update action should redirect when model is valid' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    <%= class_name %>.any_instance.stub(:valid?) { true }
    put :update, id: <%= instance_name %>.id, <%= instance_name %>: <%= instance_name %>.attributes.reject {|k,v| ['id'].include?(k)}, format: :json
    expect(response.status.to_i).to eq 200)
  end
<% end %>
