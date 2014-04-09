class Event < ActiveRecord::Base

  belongs_to :owner, class_name: :user

  after_initialize :set_defaults

  validates :title, presence: true

  has_many :tasks
  has_many :messages

  def set_defaults
    self.date_time ||= Date.today
    self.complete ||= false
  end
end