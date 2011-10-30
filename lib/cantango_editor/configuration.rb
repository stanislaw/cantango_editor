module CantangoEditor
  module Configuration
    extend self

    conf_methods = [:models, :permission_types, :permission_groups, :actions]
    conf_methods_available = conf_methods.map{|cm| :"#{cm}_available" }
    
    attr_accessor *conf_methods_available

    conf_methods.each do |cm|
      define_method :"#{cm}_available" do
        instance_variable_get(:"@#{cm}_available") || send(:"#{cm}_default") 
      end
    end

    def models_default
      ActiveRecord::Base.connection.tables.collect{|t| t.classify.constantize rescue nil }.compact   
    end

    def permission_types_default
      [:user_types, :account_types, :roles, :role_groups, :licenses, :users]
    end

    def permission_groups_default
      { :roles => [:admin, :user] }
    end

    def actions_default
      [:create, :read, :update, :delete, :manage]
    end
  end
end
