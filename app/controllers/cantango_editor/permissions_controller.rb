module CantangoEditor
  class PermissionsController < ApplicationController 
    def index
      @models = Permissions.available
    end

    def create
      puts " #{params.inspect} "
    end
  end
end
