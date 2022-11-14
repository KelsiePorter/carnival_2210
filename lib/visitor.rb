class Visitor
  attr_reader :name,
              :height,
              :preferences
  attr_accessor :spending_money
  
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_integer(spending_money)
    @preferences = []
  end

  def spending_integer(spending_money)
    spending_money.delete('$').to_i
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(minimum_height)
    @height >= minimum_height
  end
end
