module CoreAttendance
  module Candidate
    class CadastreMirror < CoreCandidate::CadastreMirror

      has_many :tickets, class_name: ::CoreAttendance::Ticket
    
    end
  end
end