<% if view_language != 'jbuilder' %>
  def create
    @<%= instance_name %> = <%= class_name %>.new(params[:<%= instance_name %>])
    if @<%= instance_name %>.save
      redirect_to <%= item_url %>, notice: 'Successfully created <%= class_name.underscore.humanize.downcase %>.'
    else
      render :new
    end
  end
<% else %>
  def create
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    respond_to do |format|
      if @<%= instance_name %>.update_attributes(params[:<%= instance_name %>])
        format.html { redirect_to <%= item_url %>, notice: 'Successfully created <%= class_name.underscore.humanize.downcase %>.' }
      else
        format.html { render action: :new }
      end
    end
  end
<% end %>
