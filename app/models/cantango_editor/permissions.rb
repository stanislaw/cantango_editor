module CantangoEditor
  class Permissions
    class << self

      attr_accessor :permissions

      def models_available
        ActiveRecord::Base.connection.tables.collect{|t| t.classify.constantize rescue nil }.compact    
      end

      def models_available_names
        models_available.map(&:name).unshift "all"
      end
      
      # TODO
      def permissions_types_available
        #[:user_types, :account_types, :roles, :role_groups, :licenses, :users]
        [:roles, :role_groups]
      end

      # Temporary hash - later bind with CantangoEditor::Configuration friends"
      def permissions_groups
        {
          :roles => [:admin, :user],
          :role_groups => [:bloggers, :editors]
        }
      end

      def actions_available
        [:create, :read, :write, :delete, :manage]
      end

      # TODO
      #def parse_yml
        #@permissions = PermissionsHash[yml_file_content]
      #end
    
      def permissions
        @permissions ||= yml_file_content
      end

      def update_permissions permissions_hash
        permissions.deep_merge_permissions! permissions_hash
      end
      
      def remove_and_save_permissions permissions_hash
        return unless permissions_hash
        
        update_permissions permissions_hash
        persist_permissions! 
      end

      def save_new_permissions permissions_hash
        
        return unless permissions_hash
        
        update_permissions permissions_hash
        persist_permissions! 
      end

      def persist_permissions!
 
        File.open(permissions_file + ".save", 'w') do |out|
          YAML.dump(permissions, out)
        end
      end

      def yml_file_content
        yml_content = YAML.load_file(permissions_file)
        
        PermissionsHash[yml_content]
      rescue => e
        raise e
      end

      def permissions_file
        File.join(Rails.root, "/config/", "permissions.yml")
      end
    end
  end
end
