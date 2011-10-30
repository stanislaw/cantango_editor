require 'permissions_hash'

describe PermissionsHash do
  
  context "#deep_merge_permissions!" do
    it "should accumulate arrays if original {} is empty" do
      result = PermissionsHash[{} ].deep_merge_permissions!({:a => 1, :c => {:b => [2, 4]}} )
      result.should == {:a => 1, :c => {:b => [2, 4]}}
    end
    it "should accumulate arrays if other_hash's end values are arrays" do
      result = PermissionsHash[{:a => 1, :c => {:b => [1, 2, 3]}} ].deep_merge_permissions!({:a => 1, :c => {:b => [2, 4]}} )
      result.should == {:a => 1, :c => {:b => [1, 2, 3, 4]}}
    end
  end

  context "#deep_remove_permissions!" do
    it "should accumulate arrays if other_hash's end values are arrays" do
      result = PermissionsHash[{:a => 1, :c => {:b => [1, 2, 3]}}].deep_remove_permissions!({:a => 1, :c => {:b => [2, 4]}})
      result.should == {:a => 1, :c => {:b => [1, 3]}}
    end
  end
  
  context "#to_hash" do
    it "should return Hash object" do
      PermissionsHash.new.to_hash.should == Hash.new
      PermissionsHash[:a => 2, :b => 2].to_hash.should == {:a => 2, :b => 2}
    end

    it "should return Hash object" do
      a = PermissionsHash[{:a => 2, :b => PermissionsHash[{:c => PermissionsHash[{:d => {:e => 2}}]}]}].to_hash
      b = {:a=>2, :b=>{:c=>{:d=>{:e=>2}}}}

      a.class.should == b.class
      a.should == b
      a[:b].class.should == b[:b].class
      a[:b][:c].class.should == b[:b][:c].class
    end
  end
  
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
