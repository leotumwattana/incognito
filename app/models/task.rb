class Task < ActiveRecord::Base

  after_initialize :set_defaults

  validates :name, presence: true

  def set_defaults
    self.completed ||= false
  end


end


