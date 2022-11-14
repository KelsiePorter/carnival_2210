class Carnival 
  attr_reader :duration,
              :rides 
  
  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    if !@rides.include?(ride)
      @rides << ride
    end
  end

  def most_profitable
    @rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def most_popular
    @rides.max_by do |ride|
      ride.total_times_ridden
    end
  end

  def carnival_total_revenue
    @rides.sum do |ride|
      ride.total_revenue
    end
  end
end