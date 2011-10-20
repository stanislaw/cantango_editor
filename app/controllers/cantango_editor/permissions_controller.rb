module CantangoEditor
  class PermissionsController < ApplicationController 
   
    def index
      redirect_to :action => :by_groups_index
    end
    
    def by_models_index
      @models = Permissions.models_available
      @actions = Permissions.actions_available
    end

    def by_groups_index
      @actions = Permissions.actions_available     
      @models = Permissions.models_available
      @permissions_types = Permissions.permissions_types_available
      @permissions_groups = Permissions.permissions_groups
      @permissions = Permissions.yml_file_content
    end

    def create
      Permissions.update_permissions! params

      render :js => "location.reload(true);"
    end

    def new_target
      @new_targets_available = Permissions.models_available_names - params[:existing_targets].to_a
     
      [:ptype, :pgroup, :can_action, :crud_action].each do |param|
        instance_variable_set("@#{param}", params[param])
      end

      respond_to do |format|
        format.js
      end
    end
  end
end
