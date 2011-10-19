module CantangoEditor
  class Permissions
    def self.available
      ActiveRecord::Base.connection.tables.collect{|t| t.classify.constantize rescue nil }.compact    
    end
  end
end
