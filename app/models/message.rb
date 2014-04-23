class Message < ActiveRecord::Base

  validates :content, presence: true

  belongs_to :user
  belongs_to :event

  scope :for_event, -> (event_id) { where(event_id: event_id).order(created_at: :desc) }

end
