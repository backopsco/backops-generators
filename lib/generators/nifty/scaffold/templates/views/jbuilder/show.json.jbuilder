<%- for attribute in model_attributes -%>
<%- if attribute.name =~ /_id\z/ -%>
json.<%= attribute.name[0..-4] %> do
  json.id  <%= instance_name %>.<%= attribute.name %>
end
<%- else -%>
json.<%= attribute.name %> <%= instance_name %>.<%= attribute.name %>
<%- end -%>
<%- end -%>
