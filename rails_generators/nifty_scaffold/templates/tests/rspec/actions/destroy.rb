  it "destroy action should destroy model and redirect to index action" do
    <%= singular_name %> = Factory(:<%= singular_name %>)
    delete :destroy, id: <%= singular_name %>
    expect(response).to edirect_to(<%= items_path('url') %>)
    expect(<%= class_name %>.exists?(<%= singular_name %>.id)).to be false
    expect(<%= class_name %>.find(<%= singular_name %>.id).active).to be false
  end
