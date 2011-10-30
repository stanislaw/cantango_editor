module CantangoEditor
  module ApplicationHelper
  
    def model_tag model
      case model 
      when regex = /\/(.*)\//
        model = model[regex][$1]
        slash_tag = content_tag :span, '/', :class => "model_regex_slash"
        modeltag = content_tag :span, model, :class => "model_regex" 
        slash_tag + modeltag + slash_tag
      when regex = /^\^(\w+)/ # a category is prefixed with a '^<D-^>s'
        model = model[regex][$1]
        model = model.humanize
        
        # TODO: category aliases here
        content_tag :span, "`#{model}`", :class => "model_category"
      when regex = /\w+#\w+=.+/
        match = model[/(\w+)#(\w+)=(.+)/]
        model = match[$1]
        lstat = match[$2]
        rstat = match[$3]

        lstat_tag = content_tag :span, lstat, :class => "model_relationship_lstat"
        rstat_tag = content_tag :span, rstat, :class => "model_relationship_rstat"
        modeltag = content_tag :span, model, :class => "model_relationship_model"
        equals_tag = content_tag :span, '=', :class => "model_relationship_equals"
        sharp_tag = content_tag :span, '#', :class => "model_relationship_sharp"

        modeltag + sharp_tag + lstat_tag + equals_tag + rstat_tag

      when regex = /\w+#\w+/
        match = model[/(\w+)#(\w+)/]
        model = match[$1]
        owner = match[$2]
 
        modeltag = content_tag :span, model, :class => "model_ownership_model"
        owner_tag = content_tag :span, owner, :class => "model_ownership_owner"       
        sharp_tag = content_tag :span, '#', :class => "model_ownership_sharp"  

        modeltag + sharp_tag + owner_tag
      else
        model
      end
    end
   
    private

  end
end
