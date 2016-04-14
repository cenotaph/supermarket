class AttendeeMailer < ActionMailer::Base
  default from: "info@supermarketartfair.com"
  
  def preview_registration(attendee)
    @attendee = attendee
    mail(to: attendee.email, from: "info@supermarketartfair.com", subject: 'Welcome to Supermarket 2016')
  end
    
end
