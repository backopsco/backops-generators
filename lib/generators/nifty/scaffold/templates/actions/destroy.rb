<%- if view_language != 'jbuilder' -%>
  def destroy
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    @<%= instance_name %> = current_user.<%= instances_name %>.find(params[:id])
    @<%= instance_name %>.destroy
    redirect_to <%= items_url %>, notice: 'Successfully destroyed <%= class_name.underscore.humanize.downcase %>.'
  end
<%- elsif view_language == 'ember_api' -%>
  def destroy
    @<%= instance_name %> = current_user.<%= instances_name %>.find(params[:id])
    @<%= instance_name %>.update_attributes(status: :deleted)
    @<%= instance_name %>.destroy
    respond_to do |format|
      format.json { render nothing: true }
      format.html { redirect_to <%= items_url %>, notice: 'Successfully destroyed <%= instance_name %>.' }
    end
  end
<%- else -%>
  def destroy
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    @<%= instance_name %> = current_user.<%= instances_name %>.find(params[:id])
    @<%= instance_name %>.destroy
    respond_to do |format|
      format.html { redirect_to <%= items_url %>, notice: 'Successfully destroyed <%= class_name.underscore.humanize.downcase %>.' }
    end
  end
<%- end -%>
