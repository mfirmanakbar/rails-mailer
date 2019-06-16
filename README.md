# README

###Step 1: Create a mailer in your rails app.
> rails g mailer notification_mailer
```
create  app/mailers/notification_mailer.rb
create  app/mailers/application_mailer.rb
invoke  erb
create    app/views/notification_mailer
create    app/views/layouts/mailer.text.erb
create    app/views/layouts/mailer.html.erb
invoke  test_unit
create    test/mailers/notification_mailer_test.rb
create    test/mailers/previews/notification_mailer_preview.rb
```

###Step 2: Open app/mailers/notification_mailer.rb and set default from and create sending emails method
```
class NotificationMailer < ApplicationMailer
     default from: "something@example.com"
     def notification_email(receiver_email)
         mail(to: receiver_email, subject: 'Sample Email')
     end
 end
```

###Step 3: Create a file app/views/notification_mailer/notification_email.html.erb. it will be served as a body template in the body mail.
```
Inside app/views/notification_mailer/notification_email.html.erb
Hi dear,
This is a test email
```

###Step 4: Configure the mailer inside environment files config/environment/development.rb and config/environment/production.rb
```
config.action_mailer.delivery_method = :smtp
  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => 'gmail_username',
  :password             => 'gmail_password',
  :authentication       => "plain",
  :enable_starttls_auto => true
}
```

###Step 5: Now just call this mailer action like this.
```
NotificationMailer.notification_email("any-email-address").deliver_now
```

If during sending emails, you get any error like `Net::SMTPAuthenticationError`, you need to enable less secure apps for sending emails in your gmail setting.
