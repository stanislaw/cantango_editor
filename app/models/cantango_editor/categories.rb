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
      ['^improvisation_music', '^complex_music', '^texts'].map{|c| Category.new(c) }
    end
  end
end
