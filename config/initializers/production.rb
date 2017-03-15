class << Rails.application
  def domain
    "news.reifyworks.com"
  end

  def name
    "Market News"
  end
end

Rails.application.routes.default_url_options[:host] = Rails.application.domain

Twitter.CONSUMER_KEY = ENV["CONSUMER_KEY"]
Twitter.CONSUMER_SECRET = ENV["CONSUMER_SECRET"]
Twitter.AUTH_TOKEN = ENV["AUTH_TOKEN"]
Twitter.AUTH_SECRET = ENV["AUTH_SECRET"]
