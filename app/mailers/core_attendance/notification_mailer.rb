module CoreAttendance
  class ApplicationMailer < ActionMailer::Base
    default from: 'codhab@codhab.df.gov.br'
    
    layout 'mailer'

    def send_mail_notification(email, text)
    end
    
  end
end
