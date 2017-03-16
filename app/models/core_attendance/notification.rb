module CoreAttendance
  class Notification < ActiveRecord::Base
    self.table_name = 'extranet.attendance_notifications'

    belongs_to :cadastre, class_name: 'CoreCandidate::Cadastre'
  
  end
end
