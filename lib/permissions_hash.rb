class PermissionsHash < Hash
  def [] k
    v = super(k.to_sym) || super(k.to_s)
    
    return self.class[{}] if v.nil?
    v.kind_of?(Hash) ? self.class[v] : v 
  end
end
