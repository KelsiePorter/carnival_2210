require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do 
  let(:carnival1) { Carnival.new(10) }
  let(:ride1) { Ride.new({ name: 'Carousel', 
                            min_height: 24, 
                            admission_fee: 1, 
                            excitement: :gentle 
                          }) }
  let(:ride2) { Ride.new({ name: 'Ferris Wheel', 
                            min_height: 36, 
                            admission_fee: 5, 
                            excitement: :gentle 
                          })}
  let(:ride3) { Ride.new({ name: 'Roller Coaster', 
                            min_height: 54, 
                            admission_fee: 2, 
                            excitement: :thrilling 
                          })}

  it 'exists and has attributes' do 
    expect(carnival1.duration).to eq(10)
    expect(carnival1.rides).to eq([])
  end

  it 'a carnival can only add a ride one time' do
    carnival1.add_ride(ride1)
    carnival1.add_ride(ride1)
    carnival1.add_ride(ride2)
    carnival1.add_ride(ride3)

    expect(carnival1.rides).to eq([ride1, ride2, ride3])
  end

  it 'a carnival can return its most popular ride' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor3.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride2.board_rider(visitor1)
    ride2.board_rider(visitor2)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)
    carnival1.add_ride(ride1)
    carnival1.add_ride(ride2)
    carnival1.add_ride(ride3)

    expect(carnival1.most_profitable).to eq(ride2)
  end

  it 'can return the most popular ride' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor3.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride2.board_rider(visitor1)
    ride2.board_rider(visitor2)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)
    carnival1.add_ride(ride1)
    carnival1.add_ride(ride2)
    carnival1.add_ride(ride3)

    expect(carnival1.most_popular).to eq(ride1)
  end

  it 'can return a carnivals total revenue' do 
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor3.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride2.board_rider(visitor1)
    ride2.board_rider(visitor2)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)
    carnival1.add_ride(ride1)
    carnival1.add_ride(ride2)
    carnival1.add_ride(ride3)

    expect(carnival1.carnival_total_revenue).to eq(14)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride3.board_rider(visitor3)
    ride3.board_rider(visitor1)

    expect(carnival1.carnival_total_revenue).to eq(18)

    visitor1.add_preference(:thrilling)
    ride3.board_rider(visitor1)

    expect(carnival1.carnival_total_revenue).to eq(20)
  end
end