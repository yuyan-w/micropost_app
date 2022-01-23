User.delete_all

user_amount = 99

User.create!(
  name: "管理者ユーザー",
  email: "admin@example.com",
  password: "foobar",
  admin: true
)

User.transaction do
  1.upto(user_amount) do |i|
    user = User.create(name: "#{i}人目のユーザー", email: "test#{i}@example.com", password: "foobar")
  end
end