module CantangoEditor
  class ApplicationController < ActionController::Base
  
    helper_method :app_name

    private

    def app_name
      Rails.application.class.parent_name
    end
  end
end
