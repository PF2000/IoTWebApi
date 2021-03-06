class UserMailer < ApplicationMailer
  default from: 'mei.internetofthings@gmail.com'
 

  def mailRegisto(user)    
    @user = user
    @url  = 'http://localhost:8000/#/login'
    mail(to: @user.email, subject: 'Registo IPT OPEN DATA API')
  end

  def mailPassRecovery(user)
    @user = user
    @url  = 'http://localhost:8000/#/changePassword/'+ @user.resetToken
    mail(to: @user.email, subject: 'Recuperação de password')
  end
end