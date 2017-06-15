class FirstPostMailer < ApplicationMailer
  def first_post_email user
    @user = user
    mail to: @user.email, subject: "Congrats for your first email"
  end
end
