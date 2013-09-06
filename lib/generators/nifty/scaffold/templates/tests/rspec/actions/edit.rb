  it 'edit action should render edit template' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    get :edit, id: <%= instance_name %>.id
    expect(response).to render_template(:edit)
  end
