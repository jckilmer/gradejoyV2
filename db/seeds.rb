user = User.new(
  email: "devuser@dev.com",
  password: "password1",
  password_confirmation: "password1"
)
user.skip_confirmation!
user.save!

user = User.new(
  email: "test@test.com",
  password: "password1",
  password_confirmation: "password1"
)
user.skip_confirmation!
user.save!
