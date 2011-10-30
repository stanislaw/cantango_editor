CantangoEditor.configure do |config|
  config.permission_types_available = [:roles, :role_groups]
  config.models_available = config.models_available << Admin
end
