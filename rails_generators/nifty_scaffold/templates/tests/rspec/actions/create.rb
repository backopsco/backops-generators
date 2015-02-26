  it "create action should render new template when model is invalid" do
    <%= singular_name %> = Factory.build(:<%= singular_name %>)
    allow_any_instance_of(<%= class_name %>).to receive(:valid?).and_return(false)
    post :create, <%= singular_name %>: { <%= singular_name %>.attributes.reject{|k,v| [<%= attributes.map { |a| "'#{a.name}'" }.join(", ") %>].include?(k)} }
    expect(response).to render_template(:new)
  end

  it "create action should redirect when model is valid" do
    <%= singular_name %> = Factory.build(:<%= singular_name %>)
    allow_any_instance_of(<%= class_name %>).to receive(:valid?).and_return(true)
    post :create, <%= singular_name %>: { <%= singular_name %>.attributes.reject{|k,v| [<%= attributes.map { |a| "'#{a.name}'" }.join(", ") %>].include?(k)} }
    expect(response).to redirect_to(<%= item_path_for_spec('url') %>)
  end
