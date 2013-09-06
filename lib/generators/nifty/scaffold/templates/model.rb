class <%= class_name %> < ActiveRecord::Base
<%= "  self.table_name = '#{table_name}'" if table_name -%>
  attr_accessible <%= model_attributes.map { |a| ":#{a.name}" }.join(', ') %>
end
