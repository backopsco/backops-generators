  def index
    @<%= instances_name %> = <%= class_name %>.order(sort_column + " " + sort_direction).
                                              paginate(page: pagination_page, per_page: pagination_rows)
  end
