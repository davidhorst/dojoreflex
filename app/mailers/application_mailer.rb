require 'mail'

class ApplicationMailer < ActionMailer::Base

   options = { :address              => "smtp.gmail.com",
               :port                 => 587,
               :user_name            => 'atestkumon@gmail.com',
               :password             => 'aTestKumon01)!',
               :authentication       => 'plain',
               :enable_starttls_auto => true  }

   Mail.defaults do
     delivery_method :smtp, options
   end

end
