  it "edit action should render edit template" do
    <%= singular_name %> = Factory(:<%= singular_name %>)
    get :edit, id: <%= singular_name %>.id
    expect(response).to render_template(:edit)
  end
