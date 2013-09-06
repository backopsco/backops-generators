<%- for attribute in model_attributes -%>
  @<%= instance_name %>.<%= attribute.name %>
<%- end -%>
