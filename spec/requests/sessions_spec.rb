require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /login" do
    context "正しいユーザー情報を入力した場合" do
      let(:user_params) do
        create(:user, email: "login@example.com", password: "foobar")
        { email: "login@example.com", password: "foobar" }
      end
      example "ログイン済みの状態になる" do
        post login_path, params: { session: user_params } 
        expect(is_logged_in?).to be true
      end
    end
  end

  describe "DELETE /logout" do
    context "ログイン済みのユーザーがログアウトした時" do
      let(:user_params) do
        create(:user, email: "login@example.com", password: "foobar")
        { email: "login@example.com", password: "foobar" }
      end
      example "ログアウト状態になる" do
        post login_path, params: { session: user_params } 
        expect(is_logged_in?).to be true
        delete logout_path
        expect(is_logged_in?).to be false
      end
    end

  end
end
