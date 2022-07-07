class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :file, AudiofileUploader

  def user
    return User.find_by(id: self.user_id)
  end
end
