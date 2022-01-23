User.delete_all
Micropost.delete_all

user_amount = 30

admin = User.create!(
  name: "管理者ユーザー",
  email: "admin@example.com",
  password: "foobar",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

30.times do
  admin.microposts.create!(content: Faker::Lorem.word)
end

User.transaction do
  1.upto(user_amount) do |i|
    user = User.create(name: "#{i}人目のユーザー", email: "test#{i}@example.com",
        password: "foobar", activated: true, activated_at: Time.zone.now)
    Random.rand(0..3).times do
      user.microposts.create!(content: Faker::Lorem.word)
    end
  end
end