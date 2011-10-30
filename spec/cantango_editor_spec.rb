require 'spec_helper'

describe CantangoEditor do
  subject { CantangoEditor }
  it { should be_kind_of(Module) }

  its(:config) { should == CantangoEditor::Configuration }

  it ".configure" do
    CantangoEditor.configure do |config|
      config.models_available = ["Post"]
    end.should == CantangoEditor::Configuration

    CantangoEditor.config.models_available.should == ["Post"]
  end

end
