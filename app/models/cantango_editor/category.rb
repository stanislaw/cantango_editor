module CantangoEditor
  class Category

    attr_reader :name

    # TODO: Should we opt aliases in the categories.yml?

    def initialize category_name, targets_string
      @category_name = category_name
      #@targets = targets_string
    end

    def name
      "^" << @category_name
    end

    def human_name
      name.gsub(/\^/,'').humanize
    end
  end
end
