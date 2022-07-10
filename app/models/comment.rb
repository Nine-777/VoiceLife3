class Comment < ApplicationRecord
  validates :comment, {length: {maximum: 140}}
    belongs_to :post
    belongs_to :user
  end
