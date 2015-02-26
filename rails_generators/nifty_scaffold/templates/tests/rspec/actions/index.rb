  it "index action should render index template" do
    <%= singular_name %> = Factory(:<%= singular_name %>)
    get :index
    expect(response).to render_template(:index)
  end
