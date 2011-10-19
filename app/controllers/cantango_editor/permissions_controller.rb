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
    end

    def create
      puts " #{params.inspect} "

      render :js => "location.reload(true);"
    end
  end
end
