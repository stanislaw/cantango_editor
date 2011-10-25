module CantangoEditor
  class Category

    attr_reader :name, :alias_name

    def initialize name, alias_name = nil
      @name = name 
      @alias_name = alias_name
    end

    def human_name
      alias_name || name.scan(/[A-Za-z]+/).map{|m| m.camelize}.join(' ')
    end
  end
end
