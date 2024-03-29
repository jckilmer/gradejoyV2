module FeatureHelpers
  def log_in(user)
    log_in_page.visit_page.log_in(user)
  end

  # Taken from https://gist.github.com/mattwynne/1228927
  #
  # usage:
  # it "should return a result of 5" do
  #   eventually { long_running_thing.result.should eq(5) }
  # end
  #
  def eventually(options = {})
    timeout = options[:timeout] || 2
    interval = options[:interval] || 0.1
    time_limit = Time.now + timeout
    loop do
      begin
        result = yield
      rescue RSpec::Expectations::ExpectationNotMetError, StandardError => error
      end
      return result if error.nil?
      raise error if Time.now >= time_limit
      sleep interval
    end
  end

  def select_date_and_time(date, options = {})
    field = options[:from]
    select date.strftime('%Y'),  from: "#{field}_1i" #year
    select date.strftime('%B'),  from: "#{field}_2i" #month
    select date.strftime('%-d'), from: "#{field}_3i" #day
    select date.strftime('%H'),  from: "#{field}_4i" #hour
    select date.strftime('%M'),  from: "#{field}_5i" #minute
  end

  def select_date(date, options = {})
    field = options[:from]
    select date.strftime('%Y'),  from: "#{field}_1i" #year
    select date.strftime('%B'),  from: "#{field}_2i" #month
    select date.strftime('%-d'), from: "#{field}_3i" #day
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
