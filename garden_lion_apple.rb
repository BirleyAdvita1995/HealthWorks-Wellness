# main.rb

class HealthcareProvider
  attr_reader :name
  attr_reader :location
  attr_reader :services

  def initialize(name, location, services)
    @name = name
    @location = location
    @services = services
  end

  def list_services
    puts "The list of services are #{services.join(', ')}."
  end
end

class PrimaryCare < HealthcareProvider
  attr_reader :preventive_care_services

  def initialize(name, location, services, preventive_care_services)
    super(name, location, services)
    @preventive_care_services = preventive_care_services
  end

  def list_preventive_care_services
    puts "The list of preventive care services are #{preventive_care_services.join(', ')}."
  end
end

class UrgentCare < HealthcareProvider
  attr_reader :urgent_care_services

  def initialize(name, location, services, urgent_care_services)
    super(name, location, services)
    @urgent_care_services = urgent_care_services
  end

  def list_urgent_care_services
    puts "The list of urgent care services are #{urgent_care_services.join(', ')}."
  end
end

class ComprehensiveProvider < PrimaryCare
  def initialize(name, location, services, preventive_care_services, urgent_care_services)
    super(name, location, services, preventive_care_services)
    @urgent_care_services = urgent_care_services
  end

  def list_urgent_care_services
    puts "The list of urgent care services are #{urgent_care_services.join(', ')}."
  end
end

# Create a new instance of the ComprehensiveProvider
services = ["primary care", "well visits", "labs", "x-rays", "vaccinations", "illness care", "injury care", "follow-up visits"]
preventive_care_services = ["well visits", "labs", "vaccinations"]
urgent_care_services = ["illness care", "injury care"]

provider = ComprehensiveProvider.new("Johns Hopkins", "Baltimore, MD", services, preventive_care_services, urgent_care_services)

# List services that the provider offers
provider.list_services
provider.list_preventive_care_services
provider.list_urgent_care_services

puts "Johns Hopkins offers comprehensive preventive care and urgent care services to keep patients healthy and happy."