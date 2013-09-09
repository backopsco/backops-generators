json.<%= instance_name %> do
  <%- for attribute in model_attributes -%>
  json.<%= attribute.name %> @<%= instance_name %>.<%= attribute.name %>
  <%- end -%>
end
