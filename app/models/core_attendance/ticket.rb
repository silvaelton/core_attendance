module CoreAttendance
  class Ticket < ApplicationRecord
    
    belongs_to :cadastre, class_name: "CoreCandidate::Cadastre"
    belongs_to :convocation, class_name: "CoreCandidate::Convocation"
    belongs_to :ticket_context
    belongs_to :ticket_status

    has_many :ticket_uploads
    has_many :ticket_comments

  end
end
