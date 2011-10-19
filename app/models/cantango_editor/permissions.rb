module CantangoEditor
  class Permissions
    class << self

      def models_available
        ActiveRecord::Base.connection.tables.collect{|t| t.classify.constantize rescue nil }.compact    
      end

      # TODO
      def permissions_types_available
        #[:user_types, :account_types, :roles, :role_groups, :licenses, :users]
        [:roles, :role_groups]
      end

      def permissions_groups
        {
          :roles => [:admin, :user],
          :role_groups => [:bloggers, :editors]
        }
      end

      def actions_available
        [:create, :read, :update, :delete, :manage]
      end
    end
  end
end
