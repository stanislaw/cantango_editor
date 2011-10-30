require 'spec_helper'

describe CantangoEditor::Permissions do
  
  subject { CantangoEditor::Permissions }
  let(:conf_methods) { [:models_available, :permission_types_available, :permission_groups_available, :actions_available] }
  
  specify { should respond_to *conf_methods }
end
