  it "update action should render edit template when model is invalid" do
    <%= singular_name %> = Factory(:<%= singular_name %>)
    allow_any_instance_of(<%= class_name %>).to receive(:valid?).and_return(false)
    put :update, id: <%= singular_name %>.id, <%= singular_name %>: { <%= singular_name %>.attributes.reject{|k,v| [<%= attributes.map { |a| "'#{a.name}'" }.join(", ") %>].include?(k)} }
    expect(response).to render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    <%= singular_name %> = Factory(:<%= singular_name %>)
    allow_any_instance_of(<%= class_name %>).to receive(:valid?).and_return(true)
    put :update, id: <%= singular_name %>.id, <%= singular_name %>: { <%= singular_name %>.attributes.reject{|k,v| [<%= attributes.map { |a| "'#{a.name}'" }.join(", ") %>].include?(k)} }
    expect(response).to redirect_to(<%= item_path_for_spec('url') %>)
  end
