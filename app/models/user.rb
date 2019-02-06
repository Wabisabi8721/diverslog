class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  #画像アップロード用
  mount_uploader :image, ImageUploader
  
  has_many :logs
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :friend
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'friend_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(friend_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(friend_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def follower?(other_user)
    self.followers.include?(other_user)
  end
 
  has_many :reverses_of_member, class_name: 'Member', foreign_key: 'user_id', dependent: :destroy
  has_many :belongeds, through: :reverses_of_member, source: :log, dependent: :destroy
  
  # def join(log)
  #   self.members.find_or_create_by(log_id: log.id)
  # end
  
  # def unjoin(log)
  #   member = self.members.find_by(log_id: log.id)
  #   member.destroy if member
  # end
  
  # def joining?(log)
  #   self.joinings.include?(log)
  # end
  
  
end
