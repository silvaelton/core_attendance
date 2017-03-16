require_dependency 'core_attendance/notification'

module CoreAttendance
  class NotificationService
      
    attr_accessor :cadastre, :notification

    AUTH_TOKEN = APP_ENV['onesignal']['auth_token']
    APP_ID     = APP_ENV['onesignal']['app_id']

    def initialize(cadastre = nil)
      @cadastre = cadastre
    end

    def create_notification(category_id: 1, content: "", title: "", link: false, push: false)

      @notification = Notification.new do |notification|
        notification.cadastre_id              = @cadastre.id
        notification.title                    = title
        notification.content                  = content
        notification.notification_category_id = category_id
        notification.link                     = link
      end

      @notification.save 

      if push
        send_push(heading:  @notification.title, 
                  message:  @notification.content, 
                  user_ids: @notification.cadastre.mobile_user_token) 
      end
      
    end

    def self.send_push(message: nil, user_ids: nil, heading: nil)

      return false if user_ids.nil? || message.nil?

      array = []
      array = user_ids.is_a?(Array) ? user_ids : array << user_ids

      params = {
        headings:{ en: heading },
        contents:{ en: message },
        include_player_ids: array 
      }

      @client = OneSignal::Client.new(auth_token: AUTH_TOKEN, app_id: APP_ID)

      begin
        @client.notifications.create(params)
        return true
      rescue Exception => e 
        puts e
        return false
      end
    end
    
  end
end