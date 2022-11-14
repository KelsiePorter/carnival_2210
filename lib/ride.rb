class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log
  
  def initialize(ride_attributes)
    @name = ride_attributes[:name]
    @min_height = ride_attributes[:min_height]
    @admission_fee = ride_attributes[:admission_fee]
    @excitement = ride_attributes[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def board_rider(visitor)
    @rider_log[visitor] += 1
    reduce_spending_money(visitor)
    increase_total_revenue
  end

  def reduce_spending_money(visitor)
   visitor.spending_money -= @admission_fee
  end

  def increase_total_revenue
    @total_revenue += @admission_fee
  end
end
