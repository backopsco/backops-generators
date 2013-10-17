<%- if view_language == 'ember_api' -%>
  def new
    respond_to do |format|
      format.json { render json: @<%= instance_name %>, serializer: <%= class_name %>Serializer }
      format.html { render action: :index }
    end
  end
<%- else -%>
  def new
    @<%= instance_name %> = <%= class_name %>.new
    @<%= instance_name %> = current_user.<%= instances_name %>.new
  end
<%- end -%>
