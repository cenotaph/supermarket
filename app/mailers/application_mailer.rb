# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info@supermarketartfair.com'

  def acceptance(application, user)
    @application = application
    @user = user
  end

  def application_confirmation(application, user)
    @application = application
    @user = user
    mail(to: user.email, cc: 'info@supermarketartfair.com', subject: "Your application for Supermarket #{@application.year.year}: #{@application.space.name}") do |format|
      format.html do
        if @application.booth_granted == 1
          render 'large_stand_acceptance'
        elsif @application.booth_granted == 2
          render 'small_stand_acceptance'
        elsif @application.booth_granted == 3
          render 'presentation_stand_acceptance'
        elsif @application.booth_granted == 5
          render 'maybe'
        elsif @application.booth_granted == 4
          render 'no'
        elsif @application.booth_granted == 6
          render 'pnp'
        elsif @application.booth_granted == 7
          render 'associate_gallery'
        end
      end
    end
  end
end
