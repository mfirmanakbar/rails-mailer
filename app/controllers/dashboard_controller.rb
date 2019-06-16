class DashboardController < ApplicationController

  def index
    @email = "firman.programmer@gmail.com"
    NotificationMailer.notification_email("firman.programmer@gmail.com").deliver_now
  end

end
