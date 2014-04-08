require 'spec_helper'

describe Stat do

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_numericality_of :points }
  end

  it "has default points of 0" do
    stat = Stat.new
    expect(stat.points).to eq 0
  end

end
