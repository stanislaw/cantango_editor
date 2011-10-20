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

      def permissions_types_nil_hash
        permissions_types_available.inject({}) do |result_hash, pt|
          result_hash.merge!({pt.to_s => nil})
        end
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

      def permissions
        @permissions ||= yml_file_content
      end

      def update_permissions! params
        save_new_permissions params[:new_permissions]
        remove_and_save_permissions params[:delete_permissions]
      end

      def update_new_permissions permissions_hash
        permissions.deep_merge_permissions! permissions_hash
      end
    
      def update_remove_permissions permissions_hash
        permissions.deep_remove_permissions! permissions_hash
      end

      def remove_and_save_permissions permissions_hash
        return unless permissions_hash
        
        update_remove_permissions permissions_hash
        persist_permissions! 
      end

      def save_new_permissions permissions_hash
        return unless permissions_hash

        update_new_permissions permissions_hash
        persist_permissions! 
      end

      def persist_permissions!
       
        yml = YAML.dump(permissions)

        # Sanitize permissions hash
        yml.gsub!(/\!map.*\s/,'')

        File.open(permissions_file, 'w') do |out|
          out.write yml
        end
      end

      def raw_file_content
        raw_content = ""
        File.open(permissions_file, 'r') do |f|
          raw_content = f.read
        end
     
        raw_content
      rescue => e
        raise e
      end

      def yml_file_content
        yml_content = YAML.load_file(permissions_file)
        validate_content yml_content

        PermissionsHash[yml_content]
      rescue => e
        raise e
      end

      def validate_content yml_content
        raise "#{permissions_file} should contain Hash-based information" unless yml_content.is_a?(Hash)
        raise "#{permissions_file} should not contain permission_types not listed in #permissions_types_available" if (yml_content.keys - permissions_types_available.to_strings).size > 0
      end

      def permissions_file
        create_empty_permissions_file if !File.file? permissions_file_path
        
        permissions_file_path
      end

      def create_empty_permissions_file
        File.open(permissions_file_path, 'w') do |file|
          YAML.dump(permissions_types_nil_hash, file)
        end

        permissions_file_path
      end

      def permissions_file_path
        File.join Rails.root + "config/" + "permissions.yml"
      end
    end
  end
end
