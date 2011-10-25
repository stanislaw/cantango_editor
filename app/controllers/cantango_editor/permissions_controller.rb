module CantangoEditor
  class PermissionsController < ApplicationController 
  
    before_filter :process_params, :only => [:new_target, :new_category, :new_custom_target]

    def index
      @actions = Permissions.actions_available     
      @models = Permissions.models_available
      @permissions_types = Permissions.permissions_types_available
      @permissions_groups = Permissions.permissions_groups
      @permissions = Permissions.yml_file_content

      respond_to do |format|
        format.html 
        format.js { render 'index.js.erb' }
      end
    end

    def update 
      Permissions.update_permissions! params
      
      index
    end


    def process_params
      [:ptype, :pgroup, :can_action, :crud_action].each do |param|
        instance_variable_set("@#{param}", params[param])
      end
    end

    def new_custom_target
    end
    
    def new_target
      @new_targets_available = Permissions.models_available_names - params[:existing_targets].to_a
    end

    def new_category
      @new_categories_available = Categories.available_except(params[:existing_targets].to_a)
    end
    
    def preview_raw
      @permissions_content = Permissions.raw_file_content
    end
  end
end
