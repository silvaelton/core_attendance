module CoreAttendance
  class TicketUpload < ApplicationRecord
    self.table_name = 'extranet.attendance_uploads'

    belongs_to :ticket_upload_category
  end
end
