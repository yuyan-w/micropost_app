require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /help" do
    it "正常レスポンスコードが返ってくる" do
      get help_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get /about" do
    it "正常レスポンスコードが返ってくる" do
      get about_path
      expect(response.status).to eq 200
    end
  end

  describe "Get /contact" do
    it "正常レスポンスコードが返ってくる" do
      get contact_path
      expect(response).to have_http_status(:success)
    end
  end

end
