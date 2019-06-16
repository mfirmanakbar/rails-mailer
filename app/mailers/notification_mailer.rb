class NotificationMailer < ApplicationMailer

  default from: "futsalmen@gmail.com"

  def notification_email(receiver_email)
    datenow = Time.now.strftime("%Y%d%m%H%M%S")
    subs = "#{"Try Rails Gmail "+datenow}"
    mail(to: receiver_email, subject: subs)
  end

end
