  it 'index action should render index template' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    get :index
    expect(response).to render_template(:index)
  end

<% if view_language == 'jbuilder' %>
  it 'index action should render index template' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    get :index, format: :json
    expect(response.status.to_i).to eq 200
  end
<% end %>
