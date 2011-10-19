module CantangoEditor
  class Engine < Rails::Engine
    isolate_namespace CantangoEditor
  
    config.to_prepare do
      load "#{CantangoEditor::Engine.config.root}/lib/permissions_hash.rb"    
    end
  end
end
