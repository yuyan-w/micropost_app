require "rails_helper"

RSpec.describe "Users signup", type: :request do
  describe "サインアップフォーム" do
    context "nameが空白の場合" do
      let(:new_user) do
        attributes_for(:user, name: "", email: "test@example.com", password: "foobar")
      end
      example "登録されない" do
        expect{
          post users_path, params: { user: new_user }
        }.to change{ User.count }.by(0)
      end
    end
    context "入力情報が正しい場合" do
      let(:user_params) do
        attributes_for(:user, name: "example", email: "test@example.com", password: "foobar")
      end
      example "新規登録される" do
        expect{
          post users_path, params: { user: user_params }
        }.to change{ User.count }.by(1)
      end
    end
  end
end