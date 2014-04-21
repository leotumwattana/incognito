class Event < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :participations
  has_many :participations, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :messages, dependent: :destroy

  after_initialize :set_defaults

  validates :title, presence: true

  def set_defaults
    self.date_time ||= Date.today
    self.complete ||= false
  end
end