module CantangoEditor
  class Engine < Rails::Engine
    isolate_namespace CantangoEditor
  
    config.to_prepare do
      Dir["#{CantangoEditor::Engine.config.root}/lib/*.rb"].each do |f|
        require_dependency f
      end
    end
  end
end
