class Task < ActiveRecord::Base

  after_initialize :set_defaults

  validates :name, presence: true

  belongs_to :event

  def set_defaults
    self.completed ||= false

  end
end
