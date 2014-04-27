class HashTag < ActiveRecord::Base

  belongs_to :event

  validates :tag, presence: true
  validates :tag_type, presence: true

  def self.parse(message)
    # /#suggest.location.(\w+)/.match(message)
    # message.scan(/#suggest.location.(\w+)/)
    tags = []

    # location tags
    location_tags = message.scan(/#(suggest.location).(\w+)/).map { |tag| [tag[0], tag[1]] }
    location_tags.each do |location_tag|
      tags << HashTag.new(tag: location_tag[1], tag_type: location_tag[0])
    end

    # date tags
    date_tags = message.scan(/#(suggest.date).(\w+\-\w+\-\w+)/).map { |tag| [tag[0], tag[1]] }
    date_tags.each do |date_tag|
      tags << HashTag.new(tag: date_tag[1], tag_type: date_tag[0])
    end

    # task tags
    task_tags = message.scan(/#(suggest.task).(\w+)/).map { |tag| [tag[0], tag[1]] }
    task_tags.each do |task_tag|
      tags << HashTag.new(tag: task_tag[1], tag_type: task_tag[0])
    end

    tags
  end

  def ==(other)
    self.tag == other.tag && self.tag_type == other.tag_type
  end

end
