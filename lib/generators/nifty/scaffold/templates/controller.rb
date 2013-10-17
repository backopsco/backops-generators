class <%= plural_class_name %>Controller < ApplicationController
  layout 'v2/application'
  helper_method :sort_column, :sort_direction
  skip_before_filter :setup_permissions

  <%= controller_methods :actions %>

  private

    def sort_column
      <%= class_name %>.column_names.include?(params[:sort]) ? params[:sort] : '<%= model_attributes.first.name %>'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
