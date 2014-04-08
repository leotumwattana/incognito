require 'spec_helper'

describe Message do

  before :each do
    @message = Message.new(content: "some message content")
  end

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :event }
  end

  describe "validation" do
    it { should validate_presence_of :content }
  end

end