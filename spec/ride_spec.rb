require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do 
  let(:ride1) { Ride.new({ name: 'Carousel', 
                            min_height: 24, 
                            admission_fee: 1, 
                            excitement: :gentle 
                          }) }

  it 'exists and has attributes' do 
    expect(ride1.name).to eq('Carousel')
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)
    expect(ride1.total_revenue).to eq(0)
  end
end