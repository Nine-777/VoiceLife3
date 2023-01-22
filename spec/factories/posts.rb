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
FactoryBot.define do
  factory :post do
    content {"test"}
  end
end
