module CantangoEditor
  class PermissionsController < ApplicationController 
    def index
      @models = Permissions.available
    end
  end
end
