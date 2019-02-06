class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    total_rent = @units.sum do |apartment|
      apartment.monthly_rent
    end
    total_rent.to_f / @units.count
  end

  def apartments_with_a_renter
    @units.find_all do |apartment|
      if apartment.renter != nil
        apartment.renter
      end
    end
  end

  def renter_with_highest_rent
    highest_rent = apartments_with_a_renter.max_by do |apartment|
      apartment.monthly_rent
    end
    highest_rent.renter
  end

  def annual_breakdown
    annual_hash = {}
    apartments_with_a_renter.each do |apartment|
      annual_hash[apartment.renter.name] = apartment.monthly_rent * 12
    end
    annual_hash
  end

end
