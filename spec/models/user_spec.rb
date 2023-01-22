# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  self_introduction      :text(65535)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do

  it "名前とメールアドレスとパスワードがあれば登録できる" do 
    expect(FactoryBot.create(:user)).to be_valid
  end 

  it "名前がなければ登録できない" do 
    expect(FactoryBot.build(:user, name: "")).to_not be_valid 
  end 

  it "メールアドレスがなければ登録できない" do 
    expect(FactoryBot.build(:user, email: "")).to_not be_valid 
  end 

  it "メールアドレスが重複していたら登録できない" do 
    user1 = FactoryBot.create(:user,name: "taro", email: "taro@example.com")
    expect(FactoryBot.build(:user, name: "ziro", email: user1.email)).to_not be_valid
  end 

  it "パスワードがなければ登録できない" do 
    expect(FactoryBot.build(:user, password: "")).to_not be_valid 
  end 

  it "password_confirmationとpasswordが異なる場合保存できない" do 
    expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 
  end
  

end
