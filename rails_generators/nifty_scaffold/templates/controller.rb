class <%= plural_class_name %>Controller < ApplicationController
  <%= controller_methods :actions %>

  private
    def form_info

    end

    def allowed_params
      params.require(:<%= singular_name %>).permit(<%= attributes.map { |a| ":#{a.name}" }.join(", ") %>)
    end
end
