require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do 
  let(:carnival1) { Carnival.new(10) }

  it 'exists and has attributes' do 
    expect(carnival1.duration).to eq(10)
    expect(carnival1.rides).to eq([])
  end

  it '' do
end