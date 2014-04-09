require 'spec_helper'

describe Massages do

  before :each do
    @massages = Massages.new(content:'yo' )
  end


  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :event }
  end

  describe "validations" do
    it { should validate_presence_of :content }
  end

end