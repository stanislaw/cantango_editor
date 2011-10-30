require 'spec_helper'

def configuration_methods
  [:models, :permission_types, :permission_groups, :actions]
end

describe CantangoEditor::Configuration do

  let(:conf) { CantangoEditor::Configuration }
  subject { conf }

  let(:conf_methods) { configuration_methods.map{|m| [:"#{m}_available", :"#{m}_default"] }.flatten }

  specify { should respond_to *conf_methods }

  its(:actions_default) { should == [:create, :read, :update, :delete, :manage]}

  configuration_methods.each do |conf_method|
    context ".#{conf_method}_available" do
      it "should == its default analogue" do
      end
      
      it "should allow alternate values" do
        conf.send(:"#{conf_method}_available=", [:whatever])
        conf.send(:"#{conf_method}_available").should == [:whatever]
      end
    end
  end

end
