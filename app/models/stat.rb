class Stat < ActiveRecord::Base

  after_initialize :set_defaults

  validates :points, numericality: { only_integer: true }

  belongs_to :user

  def set_defaults
    self.points ||= 0
  end

end
