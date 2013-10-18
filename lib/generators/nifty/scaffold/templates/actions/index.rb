<%- if view_language == 'ember_api' -%>
  def index
    respond_to do |format|
      format.json { render json: <%= instances_name %>, each_serializer: <%= class_name %>Serializer,
                           exclude: [] }
      format.html
    end
  end
<%- else -%>
  def index
    @<%= instances_name %> = <%= class_name %>.order(sort_column + " " + sort_direction)
                                              .paginate(page: pagination_page, per_page: pagination_rows)
    @<%= instances_name %> = current_user.<%= instances_name %>.order(sort_column + " " + sort_direction)
                                          .paginate(page: pagination_page, per_page: pagination_rows)
  end
<%- end -%>
