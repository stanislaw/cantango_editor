require 'permissions_hash'

describe PermissionsHash do
  context "[]" do
    let(:phash) do  
      PermissionsHash.new
    end
    
    it "should accept both symbols and strings as keys" do
      phash[:a] = 1
      phash[:a].should == 1
      phash['a'].should == 1
    end

    it "should return empty PermissionHash if key passed don't exist" do
      phash[:a].should == PermissionsHash.new
    end
 
    it "should return PermissionHash based on value if value is a Hash
        and just a value otherwise" do
      phash[:a] = {:a => 2}
      phash[:a].should == PermissionsHash[{:a => 2}]
      phash[:b] = 'Non-hash!'
      phash['b'].should == 'Non-hash!'
    end
  end
end
