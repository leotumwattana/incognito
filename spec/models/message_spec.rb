require 'spec_helper'

describe Message do

  before :each do
    @message = Message.new(content: "some message content")
  end

  it { should belong_to(:user) }
  it { should belong_to(:event) }

  it "is valid with content" do
    expect(@message).to be_valid
  end

  it "is invalid without content" do
    @message.content = nil
    expect(@message).to be_invalid
  end

end