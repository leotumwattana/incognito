class Event < ActiveRecord::Base

  has_many :users, through: :participations
  has_many :participations

  after_initialize :set_defaults

  validates :title, presence: true

  has_many :tasks
  has_many :messages

  def set_defaults
    self.date_time ||= Date.today
    self.complete ||= false
  end

  # alias_method :old_date_time, :date_time

  # def date_time
  #   # self.send(old_date_time).to_time
  # end
end