class << Rails.application
    def domain
      "marketnews.herokuapp.com"
    end

    def name
      "Market News"
    end
  end

  Rails.application.routes.default_url_options[:host] = Rails.application.domain
