<%- if view_language != 'jbuilder' -%>
  def update
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    @<%= instance_name %> = current_user.<%= instances_name %>.find(params[:id])
    if @<%= instance_name %>.update_attributes(allowed_params)
      redirect_to <%= item_url %>, notice: 'Successfully updated <%= class_name.underscore.humanize.downcase %>.'
    else
      render :edit
    end
  end
<%- elsif view_language == 'ember_api' -%>
  def update
    @<%= instance_name %> = current_user.<%= instances_name %>.find(params[:id])
    respond_to do |format|
      if @<%= instance_name %>.update_attributes(allowed_params)
        format.json { render json: <%= class_name %>Decorator.decorate(@<%= instance_name %>),
                             serializer: <%= class_name %>Serializer }
        format.html { redirect_to <%= item_url %>,
                                  notice: 'Successfully updated <%= instance_name %>.' }
      else
        format.json { render json: @<%= instance_name %>.errors, status: 422 }
        format.html { render action: :index }
      end
    end
  end
<%- else -%>
  def update
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    @<%= instance_name %> = current_user.<%= instances_name %>.find(params[:id])
    respond_to do |format|
      if @<%= instance_name %>.update_attributes(allowed_params)
        format.html { redirect_to <%= item_url %>, notice: 'Successfully updated <%= class_name.underscore.humanize.downcase %>.' }
      else
        format.html { render action: :edit }
      end
    end
  end
<%- end -%>
