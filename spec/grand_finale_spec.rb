require 'airport'
require 'plane'
require 'airspace'

# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do

  let(:sunny_airport) {Airport.new}
  let(:plane) {Plane.new}
  let(:airspace) {Airspace.new}

  it 'should allow all planes to land and all planes to take off' do
    allow(sunny_airport).to receive(:weather_condition).and_return(:sunny)
    6.times {airspace.accept(Plane.new)}
    airspace.planes.each do | plane |
      sunny_airport.land(plane, airspace)
    end
    sunny_airport.planes.each do | plane |
      expect(plane).not_to be_flying
    end
    sunny_airport.planes.each do | plane |
      sunny_airport.launch(plane, airspace)
    end
    airspace.planes.each do | plane |
      expect(plane).to be_flying
    end
  end


end