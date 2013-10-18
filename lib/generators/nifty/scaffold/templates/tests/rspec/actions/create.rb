<%- unless view_language == 'ember_api' -%>
  it 'create action should render new template when model is invalid' do
    <%= instance_name %> = FactoryGirl.build(:<%= instance_name %>)
    <%= class_name %>.any_instance.stub(:valid?) { false }
    post :create, <%= instance_name %>: <%= instance_name %>.attributes.reject {|k,v| ['id'].include?(k)}
    expect(response).to render_template(:new)
  end

  it 'create action should redirect when model is valid' do
    <%= instance_name %> = FactoryGirl.build(:<%= instance_name %>)
    <%= class_name %>.any_instance.stub(:valid?) { true }
    post :create, <%= instance_name %>: <%= instance_name %>.attributes.reject {|k,v| ['id'].include?(k)}
    expect(response).to redirect_to(<%= item_path_for_spec('url') %>)
  end
<%- end -%>

<%- if view_language == 'jbuilder' || view_language == 'ember_api' -%>
  it 'create action should render new template when model is invalid' do
    <%= instance_name %> = FactoryGirl.build(:<%= instance_name %>)
    <%= class_name %>.any_instance.stub(:valid?) { false }
    post :create, <%= instance_name %>: <%= instance_name %>.attributes.reject {|k,v| ['id'].include?(k)}, format: :json
    expect(response.status.to_i).to eq 400
  end

  it 'create action should redirect when model is valid' do
    <%= instance_name %> = FactoryGirl.build(:<%= instance_name %>)
    <%= class_name %>.any_instance.stub(:valid?) { true }
    post :create, <%= instance_name %>: <%= instance_name %>.attributes.reject {|k,v| ['id'].include?(k)}, format: :json
    expect(response.status.to_i).to eq 200
  end
<%- end -%>
