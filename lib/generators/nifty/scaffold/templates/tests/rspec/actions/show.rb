  it 'show action should render show template' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    get :show, id: <%= instance_name %>.id
    expect(response).to render_template(:show)
  end

<% if view_language == 'jbuilder' %>
  it 'show action should render show template' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    get :show, id: <%= instance_name %>.id, format: :json
    expect(response.status.to_i).to eq 200)
  end
<% end %>
