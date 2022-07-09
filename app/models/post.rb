class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  mount_uploader :file, AudiofileUploader

  def user
    return User.find_by(id: self.user_id)
  end
end
