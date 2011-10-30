require 'spec_helper'
# encoding: UTF-8

describe CantangoEditor do
  it "should GET /" do
    get root_path
    response.code.should == "200"
  end
end
