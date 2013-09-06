  it 'show action should render show template' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    get :show, id: <%= instance_name %>.id
    expect(response).to render_template(:show)
  end
