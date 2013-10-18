<%- unless view_language == 'ember_api' -%>
  it 'destroy action should destroy model and redirect to index action' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    delete :destroy, id: <%= instance_name %>.id
    expect(response).to redirect_to(<%= items_url %>)
    expect(<%= class_name %>.exists?(<%= instance_name %>.id)).to be_false
    expect(<%= class_name %>.find(<%= instance_name %>.id).active).to be_false
  end
<%- end -%>

<%- if view_language != 'jbuilder' || view_language == 'ember_api' -%>
  it 'destroy action should destroy model and redirect to index action' do
    <%= instance_name %> = FactoryGirl.create(:<%= instance_name %>)
    delete :destroy, id: <%= instance_name %>.id, format: :json
    expect(<%= class_name %>.exists?(<%= instance_name %>.id)).to be_false
    expect(<%= class_name %>.find(<%= instance_name %>.id).active).to be_false
    expect(response.status.to_i).to eq 200
  end
<%- end -%>
