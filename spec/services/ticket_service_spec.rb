describe CoreAttendance::TicketService do 
  context 'manager ticket' do 

    before { @cadastre = CoreAttendance::Candidate::Cadastre.find(548574) }

    it 'cadastres find' do 
      expect(@cadastre.present?).to eq(true)
    end

    it 'creates ticket without notification' do 
    
      @service  = CoreAttendance::TicketService.new.tap do |service|
        service.cadastre = @cadastre
      end

      cadastre_mirrors_count  = @service.cadastre.cadastre_mirrors.count + 1
      dependent_mirrors_count = @service.cadastre.dependents.count * 2

      @service.create do |create|
        create.notification = false
        create.push         = false
      end

      expect(@service.cadastre.cadastre_mirrors.count).to eq(cadastre_mirrors_count)
      expect(@service.cadastre.cadastre_mirrors.count).to eq(cadastre_mirrors_count)
      expect(@service.cadastre_mirror.dependent_mirrors.count).to eq(dependent_mirrors_count)
    end

    it 'creates ticket with notification' do 
      @service  = CoreAttendance::TicketService.new.tap do |service|
        service.cadastre = @cadastre
      end

      cadastre_mirrors_count  = @service.cadastre.cadastre_mirrors.count + 1
      dependent_mirrors_count = @service.cadastre.dependents.count * 2

      @service.create do |create|
        create.notification = true
        create.push         = false
      end

      expect(@service.notification_service.notification.persisted?).to eq(true)
      expect(@service.cadastre.cadastre_mirrors.count).to eq(cadastre_mirrors_count)
      expect(@service.cadastre.cadastre_mirrors.count).to eq(cadastre_mirrors_count)
      expect(@service.cadastre_mirror.dependent_mirrors.count).to eq(dependent_mirrors_count)
    end

    it 'update ticket' do

    end

  end

  context 'upload document ' do
    
    before { 
      @cadastre = CoreAttendance::Candidate::Cadastre.find(548574) 
      @cadastre = CoreCandidate::CadastrePresenter.new(@cadastre)
    }

    it 'allow upload document by context 1' do 

      @service = CoreAttendance::TicketService.new.tap do |service|
        service.cadastre    = @cadastre
        service.context_id  = 1 
      end
      
      @service.create do |create|
        create.notification = true
        create.push         = false
      end


      @service.upload_required

      expect(@service.cadastre_mirror.present?).to eq(true)
      expect(@service.ticket.income_uploads.present?).to eq(false)

    end


    it 'disallow upload document by context 1' do 

      @service = CoreAttendance::TicketService.new.tap do |service|
        service.cadastre    = @cadastre
        service.context_id  = 1 
      end
      
      @service.create do |create|
        create.notification = true
        create.push         = false
      end


      @service.upload_required

      expect(@service.cadastre_mirror.present?).to eq(true)
      expect(@service.ticket.income_uploads.present?).to eq(false)

    end


    it 'upload document' do 
    end

    it 'upload document with association dependent' do 
    end
  end 
end