module CantangoEditor
  class PermissionsController < ApplicationController 
    def index
      @models = Permissions.available
    end

    def create
      puts " #{params.inspect} "

      render :js => "location.reload(true);"
    end
  end
end
