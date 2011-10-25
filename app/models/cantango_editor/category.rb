module CantangoEditor
  class Category

    attr_reader :name, :alias_name

    # TODO: Should we opt aliases in the categories.yml?

    def initialize name, alias_name = nil
      @name = name 
      @alias_name = alias_name
    end

    def human_name
      alias_name || name.gsub(/\^/,'').humanize
    end
  end
end
