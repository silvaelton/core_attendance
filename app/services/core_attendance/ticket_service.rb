require_dependency 'core_attendance/ticket'
require_dependency 'core_attendance/notification_service'

module CoreAttendance
  class TicketService

    attr_accessor :cadastre_mirror, :cadastre

    def initialize(cadastre: nil, cadastre_mirror: nil, ticket: nil, context_id: nil)
      @cadastre         = cadastre
      @cadastre_mirror  = cadastre_mirror
      @context_id       = context_id.to_i
      @ticket           = ticket
    end

    def create(ticket_status_id = 1)

      return false if @cadastre.nil? || @context_id.nil?

      clone_cadastre_to_make_mirror!

      @ticket = Ticket.new({
        ticket_context_id: @context_id,
        ticket_status_id: ticket_status_id, 
        cadastre_id: @cadastre.id,
        cadastre_mirror_id: @cadastre_mirror.id
      })

      @ticket.save
    end

    def update(ticket_status_id = nil)
      return false if ticket_status_id.nil? || @cadastre.nil?

      @service = NotificatioService.new(cadastre: @cadastre)
      
      @service.create_notification do |service| 
        service.category_id = 2
        service.title       = ''
        service.content     = ''
        service.link        = ''
        service.push        = true
      )
    end


    private

    
    def clone_cadastre_to_make_mirror!
      return false if @cadastre.nil?

      @cadastre_mirror = @cadastre.cadastre_mirrors.new

      @cadastre.attributes.each do |key, value|
        unless %w(id created_at updated_at).include? key
          @cadastre_mirror[key] = value if @cadastre_mirror.attributes.has_key?(key)
        end
      end

      @cadastre_mirror.save
    
      @dependents = @cadastre.dependents

      @dependents.each do |dependent|
        @new_dependent = @cadastre_mirror.dependent_mirrors.new
        
        dependent.attributes.each do |key, value|
          unless %w(id created_at updated_at).include? key
            @new_dependent[key] = value if @new_dependent.attributes.has_key?(key)
          end
        end

        @new_dependent.save
    
      end
    end



  end
end
