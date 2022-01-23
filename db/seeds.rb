User.delete_all

user_amount = 20

User.transaction do
  1.upto(user_amount) do |i|
    user = User.create(name: "#{i}人目のユーザー", email: "test#{i}@example.com", password: "foobar")
  end
end