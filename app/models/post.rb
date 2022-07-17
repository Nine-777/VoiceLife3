# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  file       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
  has_many :comments
  mount_uploader :file, AudiofileUploader

  def self.search(keyword)
    where(["content like?" , "%#{keyword}%"])
  end

  def user
    return User.find_by(id: self.user_id)
  end
end
