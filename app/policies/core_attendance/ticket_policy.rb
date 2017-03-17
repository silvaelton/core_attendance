module CoreAttendance
  class TicketPolicy

    def initialize(ticket: nil, cadastre: nil)
      @cadastre = cadastre
      @ticket   = ticket
    end

    def create?
      !@cadastre.tickets.where(ticket_status_id: [1,3,4,5]).present?
    end

    def update?
      !create?
    end

    def cancel?
      [1,2,3].include? @ticket.ticket_status_id
    end

  end
end