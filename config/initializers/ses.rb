require 'net/smtp'

module Net
  # Force TLS over SMTP
  class SMTP
    def tls?
      true
    end
  end
end

Grinders::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'email-smtp.us-east-1.amazonaws.com',
    authentication: :login,
    user_name: ENV['SES_USERNAME'],
    password: ENV['SES_PASSWORD'],
    enable_starttls_auto: true,
    port: 465
  }
end
