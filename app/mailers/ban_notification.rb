class BanNotification < ActionMailer::Base
  default :from => "#{Rails.application.name} " <<
    "<hello@#{Rails.application.domain}>"

  def notify(user, banner, reason)
    @banner = banner
    @reason = reason

    mail(
      :from => "#{@banner.username} <hello@#{Rails.application.domain}>",
      :replyto => "#{@banner.username} <#{@banner.email}>",
      :to => user.email,
      :subject => "[#{Rails.application.name}] You have been banned"
    )
  end
end
