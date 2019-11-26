class EmployerMailer < ApplicationMailer
  default :from => 'Shiift__@hotmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def employer_signup_email(employer)
    @employer = employer
    mail( :to => @employer.email,
    :subject => 'Thanks for signing up for Shiift' )
  end
end
