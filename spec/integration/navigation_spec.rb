# encoding: UTF-8

require 'spec_helper'

feature "Basic usage of CantangoEditor" do

  background do
  end

  scenario "" do
    with page do
      visit '/cantango_editor/permissions'
      body.should =~ /roles:/
      body.should =~ /role_groups:/     
      body.should =~ /CantangoEditor/
    end
  end
end
