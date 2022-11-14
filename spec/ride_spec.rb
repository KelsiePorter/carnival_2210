require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do 
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
    expect(ride1.name).to eq('Carousel')
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)
    expect(ride1.total_revenue).to eq(0)
  end

  it 'can board a ride on the ride' do 
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)

    expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
  end

  it 'reduces the visitors spending money every time they ride' do 
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)

    expect(visitor1.spending_money).to eq(8)
    expect(visitor2.spending_money).to eq(4)
  end

  it 'a rides revenue increases with each boarded rider' do 
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)

    expect(ride1.total_revenue).to eq(3)
  end

  it 'can return a riders new spending money total after paying for a ride' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride3.board_rider(visitor1)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)

    expect(visitor1.spending_money).to eq(8)
    expect(visitor2.spending_money).to eq(4)
    expect(visitor3.spending_money).to eq(13)
    expect(ride3.rider_log).to eq(visitor3 => 1)
    expect(ride3.total_revenue).to eq(2)
  end

  it 'can return the total number of times a ride was ridden' do 
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor3.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride2.board_rider(visitor1)
    ride2.board_rider(visitor2)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)

    expect(ride1.total_times_ridden).to eq(3)
    expect(ride2.total_times_ridden).to eq(2)
    expect(ride3.total_times_ridden).to eq(1)
  end
end