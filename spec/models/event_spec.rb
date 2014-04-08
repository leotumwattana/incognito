require 'spec_helper'

describe Event do

  it "is invalid without a title" do
    event = Event.new
    event.title == ""
    expect(event).to be_invalid
    expect(event).to have(1).error_on(:title)
  end

  it "default date is set to today's date" do
    event = Event.new
    expect(event.date_time).to eq(Date.today)
  end

  it "default Complete field set to false" do
    event = Event.new
    expect(event.complete).to eq(false)
  end

end