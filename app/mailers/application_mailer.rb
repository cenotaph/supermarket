class ApplicationMailer < ActionMailer::Base
  default from: "info@supermarketartfair.com"
  
  def acceptance(application, user)
    @application = application
    @user = user
  end
  
  def application_confirmation(application, user)
    @application = application
    @user = user
    mail(to: user.email, cc: 'info@supermarketartfair.com', subject: "Your application for Supermarket #{@application.year.year.to_s}: #{@application.space.name}") do |format|
      format.html {
        if @application.booth_granted == 1
          render "large_stand_acceptance"
        elsif @application.booth_granted == 2
          render "small_stand_acceptance"
        elsif @application.booth_granted == 3
          render "presentation_stand_acceptance"
        end
      }
    end
  end
  
end
