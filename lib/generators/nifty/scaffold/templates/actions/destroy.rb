<% if view_language != 'jbuilder' %>
  def destroy
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    @<%= instance_name %>.destroy
    redirect_to <%= items_url %>, notice: 'Successfully destroyed <%= class_name.underscore.humanize.downcase %>.'
  end
<% else %>
  def destroy
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    @<%= instance_name %>.destroy
    respond_to do |format|
      format.html { redirect_to <%= items_url %>, notice: 'Successfully destroyed <%= class_name.underscore.humanize.downcase %>.' }
    end
  end
<% end %>
