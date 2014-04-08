require 'spec_helper'

describe Stat do

  it "has default points of 0" do
    stat = Stat.new
    expect(stat.points).to eq 0
  end

  it { should belong_to(:user) }

end
