  it 'edit action should render edit template' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    get :edit, id: <%= instance_name %>.id
    expect(response).to render_template(:edit)
  end

<% if view_language == 'jbuilder' %>
  it 'edit action should render edit template' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    get :edit, id: <%= instance_name %>.id, format: :json
    expect(response.status.to_i).to eq 200)
  end
<% end %>
