<%- unless view_language == 'ember_api' -%>
  it 'new action should render new template' do
    get :new
    expect(response).to render_template(:new)
  end
<%- end -%>

<%- if view_language == 'jbuilder' || view_language == 'ember_api' -%>
  it 'new action should render new template' do
    get :new, format: :json
    expect(response.status.to_i).to eq 200
  end
<%- end -%>
