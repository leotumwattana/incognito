require 'spec_helper'

describe HashTag do

  it { should belong_to(:event) }

  describe "validations" do
    context "tag" do
      it { should validate_presence_of :tag }
    end

    context "tag_type" do
      it { should validate_presence_of :tag_type }
    end
  end

  describe "parse(message)" do

    before :each do
      @message = 'Hi Mark, I #suggest.location.SaiKung on #suggest.date.2014-05-05, #suggest.task.Beer'
      @tag1 = HashTag.new tag: 'SaiKung', tag_type: 'suggest.location'
      @tag2 = HashTag.new tag: '2014-05-05', tag_type: 'suggest.date'
      @tag3 = HashTag.new tag: 'Beer', tag_type: 'suggest.task'
    end

    it "parses tags out of message" do
      hash_tags = HashTag.parse(@message)
      expect(hash_tags).to include @tag1
      expect(hash_tags).to include @tag2
      expect(hash_tags).to include @tag3
    end
  end
end
