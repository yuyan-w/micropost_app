require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/static_pages/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /help" do
    # it "returns http success" do
    #   get "/static_pages/help"
    #   expect(response).to have_http_status(:success)
    # end
    it "正常レスポンスコードが返ってくる" do
      get static_pages_help_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get /about" do
    it "正常レスポンスコードが返ってくる" do
      get static_pages_about_url
      expect(response.status).to eq 200
    end
  end

end
