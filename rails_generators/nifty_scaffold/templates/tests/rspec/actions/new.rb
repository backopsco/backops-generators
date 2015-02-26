  it "new action should render new template" do
    get :new
    expect(response).to render_template(:new)
  end
