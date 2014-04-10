require 'spec_helper'

describe Participation do

  # Shoulda association expectations does not catch missing foreign keys
  # hence we are testing it here
  it "has user_id" do
    participation = Participation.new
    expect(participation).to respond_to :user_id
  end

  it "has event_id" do
    participation = Participation.new
    expect(participation).to respond_to :event_id
  end


end