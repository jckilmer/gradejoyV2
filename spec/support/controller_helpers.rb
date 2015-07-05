module ControllerHelpers
  def log_in_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end
end

RSpec.configure do |config|
  config.include ControllerHelpers, type: :controller
end
