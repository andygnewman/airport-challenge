require 'airspace'

describe Airspace do
  
  let(:airspace) { Airspace.new}
  let(:plane) {Plane.new}

  it 'should contain a plane when a plane is created' do
    airspace.accept(plane)
    expect(airspace.number_planes?).to eq(1)
  end

end