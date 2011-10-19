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
      render :js => "location.reload(true);"
    end

    def new_target
      respond_to do |format|
        format.js
      end
    end
  end
end
