class << Rails.application
    def domain
      "reifyworks.com"
    end

    def name
      "Market News"
    end
  end

  Rails.application.routes.default_url_options[:host] = Rails.application.domain
