class << Rails.application
    def domain
      "grinde.rs"
    end

    def name
      "Grinders"
    end
  end

  Rails.application.routes.default_url_options[:host] = Rails.application.domain
