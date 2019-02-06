class Member < ApplicationRecord
  belongs_to :user
  belongs_to :log
  
  validates :user_id, presence: true
  
  # has_many :messages_for_receiver, class_name: 'Message', foreign_key: 'speaker_id', dependent: :destroy
  # has_many :receptions, through: :messages_for_receiver, source: :receiver, dependent: :destroy
  # has_many :messages_to_receiver, class_name: 'Message', foreign_key: 'receiver_id', dependent: :destroy
  # has_many :transmissions, through: :messages_to_receiver, source: :speaker, dependent: :destroy
end
