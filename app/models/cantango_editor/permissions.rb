module CantangoEditor
  class Permissions
    def self.available
      ActiveRecord::Base.descendants
    end
  end
end
