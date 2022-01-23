require "rails_helper"

RSpec.describe "Users signup", type: :request do
  describe "サインアップフォーム" do
    context "nameが空白の場合" do
      let(:invalid_user_params) do
        attributes_for(:user, name: "", email: "test@example.com", password: "foobar")
      end
      example "登録されない" do
        expect{
          post users_path, params: { user: invalid_user_params }
        }.to change{ User.count }.by(0)
      end
    end
    context "入力情報が正しい場合" do
      let(:valid_user_params) do
        attributes_for(:user, name: "example", email: "test@example.com", password: "foobar")
      end
      example "新規登録される、かつログイン済みである" do
        expect{
          post users_path, params: { user: valid_user_params }
        }.to change{ User.count }.by(1)
        expect(is_logged_in?).to be_truthy
      end
    end
  end
end