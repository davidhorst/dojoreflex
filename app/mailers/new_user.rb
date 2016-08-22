require 'mail'

class NewUser < ApplicationMailer

   options = { :address              => "smtp.gmail.com",
               :port                 => 587,
               :user_name            => 'atestkumon@gmail.com',
               :password             => 'aTestKumon01)!',
               :authentication       => 'plain',
               :enable_starttls_auto => true  }

   Mail.defaults do
     delivery_method :smtp, options
   end

 def NewStudent(user, password)

        Mail.deliver do
           to user.email
             from 'aTestKumon@gmail.com'
             subject 'Coding Dojo New Account'
             html_part do
              content_type 'text/html; charset=UTF-8'
              body '<h3>Welcome ' + user.name + ' to the Coding Dojo</h3><p>
                    Your temporary password is ' + password + '</p>'

end
        end

 end


end
