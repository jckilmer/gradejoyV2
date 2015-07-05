module FeatureHelpers
  def log_in(user)
    log_in_page.visit_page.log_in(user)
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
