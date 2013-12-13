<%- if view_language != 'jbuilder' -%>
  def create
    @<%= instance_name %> = <%= class_name %>.new(allowed_params)
    @<%= instance_name %> = current_user.<%= instances_name %>.new(params[:<%= instance_name %>])
    if @<%= instance_name %>.save
      redirect_to <%= item_url %>, notice: 'Successfully created <%= class_name.underscore.humanize.downcase %>.'
    else
      render :new
    end
  end
<%- elsif view_language == 'ember_api' -%>
  def create
    @<%= instance_name %> = current_user.<%= instances_name %>.build(allowed_params)
    respond_to do |format|
      if @<%= instance_name %>.save
        format.json { render json: @<%= instance_name %>, serializer: <%= class_name %>Serializer }
        format.html { redirect_to <%= item_url %>, notice: 'Successfully created <%= instance_name %>.' }
      else
        format.json { render json: @<%= instance_name %>.errors, status: 422 }
        format.html { render action: :index }
      end
    end
  end
<%- else -%>
  def create
    @<%= instance_name %> = <%= class_name %>.new(allowed_params)
    @<%= instance_name %> = current_user.<%= instances_name %>.new(params[:<%= instance_name %>])
    respond_to do |format|
      if @<%= instance_name %>.update_attributes(params[:<%= instance_name %>])
        format.html { redirect_to <%= item_url %>, notice: 'Successfully created <%= class_name.underscore.humanize.downcase %>.' }
      else
        format.html { render action: :new }
      end
    end
  end
<%- end -%>
