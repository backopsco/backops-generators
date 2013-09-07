<% if view_language != 'jbuilder' %>
  def update
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    if @<%= instance_name %>.update_attributes(params[:<%= instance_name %>])
      redirect_to <%= item_url %>, notice: 'Successfully updated <%= class_name.underscore.humanize.downcase %>.'
    else
      render :edit
    end
  end
<% else %>
  def update
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    respond_to do |format|
      if @<%= instance_name %>.update_attributes(params[:<%= instance_name %>])
        format.html { redirect_to <%= item_url %>, notice: 'Successfully updated <%= class_name.underscore.humanize.downcase %>.' }
      else
        format.html { render action: :edit }
      end
    end
  end
<% end %>
