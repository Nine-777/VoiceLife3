require 'rails_helper'

RSpec.describe "LikesRankings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/likes_ranking/index"
      expect(response).to have_http_status(:success)
    end
  end

end
