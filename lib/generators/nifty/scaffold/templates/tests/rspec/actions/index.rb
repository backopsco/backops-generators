  it 'index action should render index template' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    get :index
    expect(response).to render_template(:index)
  end
