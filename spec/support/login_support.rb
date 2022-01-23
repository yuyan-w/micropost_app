module LoginUser

  def is_logged_in?
    !session[:user_id].nil?
  end

  RSpec.configure do |config|
    config.include LoginUser
  end
end