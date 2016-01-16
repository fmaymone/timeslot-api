class SlotMailer < ApplicationMailer
  #default from: 'info@timeslot.com'

  def slot_as_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
