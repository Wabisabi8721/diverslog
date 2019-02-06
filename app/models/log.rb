class Log < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :dove_on, presence: true
  validates :dove_in_at, presence: true
  validates :dove_out_at, presence: true
  validates :dove_time, presence: true
  validates :total_min, presence: true
  validates :depth_ave, presence: true
  validates :depth_max, presence: true
  validates :location, presence: true
  validates :creature, presence: true
  
  acts_as_sequenced scope: :user_id
  
  has_many :members, dependent: :destroy
  has_many :dove_togethers, through: :members, source: :user, dependent: :destroy
  
  accepts_nested_attributes_for :members, allow_destroy: true
  
  def in_member(user)
    if (self.user_id == user)
      true
    else
      self.dove_togethers.include?(user)
    end
  end
  
  has_many :messages, dependent: :destroy
  # has_many :talkings, through: :messages, source: :member
end
