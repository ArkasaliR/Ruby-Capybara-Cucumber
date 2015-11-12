module AsyncSupport
  def eventually
    timeout = 5.second
    polling_interval = 0.25.second
    time_limit = Time.now + timeout
    loop do
      begin
        yield
      rescue Exception => error
      rescue Error => error
      rescue Capybara::Poltergeist::ObsoleteNode => error
      end
      return if error.nil?
      raise error if Time.now >= time_limit
      sleep polling_interval
    end
  end
end
World(AsyncSupport)