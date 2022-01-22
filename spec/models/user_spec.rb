require 'rails_helper'

RSpec.describe User, type: :model do
  describe "name" do
    context "blankの時に" do
      let(:user) do
        build(:user, name: "")
      end
      it "invalidになる" do
        expect(user).not_to be_valid
      end
    end
    context "maxlengthにより" do
      context "50文字の場合に" do
        let(:user) do
          build(:user, name: "a" * 50)
        end
        it "validになる" do
          expect(user).to be_valid
        end
      end
      context "51文字の場合に" do
        let(:user) do
          build(:user, name: "a" * 51)
        end
        it "invalidになる" do
          expect(user).not_to be_valid
        end
      end
    end
  end

  describe "email" do
    context "blankの時に" do
      let(:user) do
        build(:user, email: "")
      end
      it "invalidになる" do
        expect(user).not_to be_valid
      end
    end
    context "maxlengthにより" do
      context "255文字の場合に" do
        let(:user) do
          build(:user, email: "@example.com".rjust(255, "a"))
        end
        it "validになる" do
          expect(user).to be_valid
        end
      end
      context "256文字の場合に" do
        let(:user) do
          build(:user, email: "@example.com".rjust(256, "a"))
        end
        it "invalidになる" do
          expect(user).not_to be_valid
        end
      end
    end
    context "メールフォーマットにより" do
      context "正しい文字列の場合に" do
        let(:user) do
          build(:user)
        end
        it "validになる" do
          valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
            first.last@foo.jp alice+bob@baz.cn]
          valid_addresses.each do |valid_address|
            user.email = valid_address
            expect(user).to be_valid
          end
        end
      end
      context "正しくない文字列の場合に" do
        let(:user) do
          build(:user)
        end
        it "invalidになる" do
          invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
            foo@bar_baz.com foo@bar+baz.com, user@example..com]
          invalid_addresses.each do |invalid_address|
            user.email = invalid_address
            expect(user).not_to be_valid
          end
        end
      end
    end

    context "一意性により同じメールアドレスの場合" do
      let(:user) do
        create(:user, email: "test@example.com")
      end
      it "エラーになる" do
        dupuser = User.new(name: "test", email: user.email)
        expect(dupuser).not_to be_valid
      end
    end
  end

  describe "password" do
    context "6文字未満の時に" do
      let(:user) do
        build(:user, password: "a" * 5)
      end
      it "エラーになる" do
        expect(user).not_to be_valid
      end
    end
  end

end
