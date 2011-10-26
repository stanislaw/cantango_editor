module CantangoEditor
  module Categories
    extend self

    attr_accessor :available

    def available_except existing_targets = []
      (available_names - existing_targets).map{|c| Category.new(c) }   
    end
 
    def available_names
      available.map{|c| c.name} 
    end
  
    def available
      yml_file_content.keys.map{|c| Category.new(c) }
    end

    def yml_file_content
      yml_content = YAML.load_file(categories_file)
      validate_content yml_content

      yml_content
    end

    def validate_content content
    end

    def categories_file
      create_empty_categories_file if !File.file? categories_file_path

      categories_file_path
    end

    def create_empty_categories_file
      File.open(categories_file_path, 'w') do |file|
        YAML.dump({}, file)
      end

      categories_file_path
    end
    
    def categories_file_path
      File.join Rails.root + "config/" + "categories.yml"
    end

  end
end
