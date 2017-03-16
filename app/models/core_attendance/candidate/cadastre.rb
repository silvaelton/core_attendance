module CoreAttendance
  module Candidate
    class Cadastre < CoreCandidate::Cadastre

      has_many :tickets, class_name: ::CoreAttendance::Ticket
    
    end
  end
end