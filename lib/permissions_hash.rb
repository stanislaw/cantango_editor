class Hash
  def to_hash!
    replace to_hash
  end

  def to_hash
    inject({}) do |h, (k,v)|
      v = v.is_a?(Hash) ? v.to_hash : v
      h.merge!({k => v})
    end
  end
end

class PermissionsHash < Hash
  def [] k, tru = nil
    v = super(k.to_sym) || super(k.to_s)
    
    return self.class[{}] if v.nil? && !tru
    v.kind_of?(Hash) ? self.class[v] : v 
  end

  def to_yaml *args
    to_hash.to_yaml *args
  end

  def to_hash
    inject({}) do |h, (k,v)|
      v = v.is_a?(Hash) ? v.to_hash : v
      h.merge!({k => v})
    end
  end

  def deep_merge_permissions other_hash
    self.dup.deep_merge_permissions! other_hash
  end

  def deep_merge_permissions! other_hash
    other_hash.each_pair do |k,v|
      tv = self[k, true]
      self[k] = if tv.is_a?(Hash) && v.is_a?(Hash) 
                  tv.deep_merge_permissions(v) 
                elsif v.is_a?(Array) || tv.is_a?(Array)
                  ([tv] + [v]).flatten.uniq.compact
                else
                  v
                end
    end
    self
  end
 
  def deep_remove_permissions other_hash
    dup.deep_remove_permissions! other_hash
  end

  def deep_remove_permissions! other_hash
    other_hash.each_pair do |k,v|
      tv = self[k, true]
      self[k] = if tv.is_a?(Hash) && v.is_a?(Hash) 
                  tv.deep_remove_permissions(v) 
                elsif v.is_a?(Array) || tv.is_a?(Array)
                  self_arr = ([tv]).flatten.uniq.compact
                  oth_arr = ([v]).flatten.uniq.compact

                  diff = self_arr - oth_arr
                  if diff.size < self_arr.size
                    diff
                  else
                   (self_arr + oth_arr).flatten.uniq.compact
                  end
                else
                  v
                end
    end
    self
  end

  private


end
