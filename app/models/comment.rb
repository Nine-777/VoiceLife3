# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
class Comment < ApplicationRecord
  validates :comment, {length: {maximum: 140}}
    belongs_to :post
    belongs_to :user
  end
