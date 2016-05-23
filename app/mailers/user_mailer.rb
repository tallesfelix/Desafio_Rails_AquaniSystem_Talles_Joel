class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.warnings.subject
include SendGrid
  sendgrid_category :use_subject_lines
  sendgrid_enable   :ganalytics, :opentrack
  sendgrid_unique_args :key1 => "value1", :key2 => "value2"

  def warnings(user)
  	@user = user
    sendgrid_category "Welcome"
    sendgrid_unique_args :key2 => "newvalue2", :key3 => "value3"
    mail :to => user.email, :subject => "Welcome #{user.nome} :-)"
  end

  
end
