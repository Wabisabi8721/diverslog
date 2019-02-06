class Message < ApplicationRecord
  belongs_to :speaker, class_name: 'User'
  belongs_to :receiver, class_name:'User'
  belongs_to :log
  
  validates :speaker_id, presence: true
  validates :receiver_id, presence: true
  validates :log_id, presence: true
end
