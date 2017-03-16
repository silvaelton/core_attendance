module CoreAttendance
  class TicketComment < ApplicationRecord
    self.table_name = 'extranet.attendance_ticket_comments'

    belongs_to :ticket
  end
end
