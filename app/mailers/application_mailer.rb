class ApplicationMailer < ActionMailer::Base
  default from: "info@supermarketartfair.com"
  
  def application_confirmation(application, user)
    @application = application
    @user = user
    mail(to: user.email, subject: "Application received for Supermarket #{@application.year.year.to_s}: #{@application.space.name}")
  end
  
end
