require 'airport'
require 'plane'
require 'airspace'

describe "The grand finale (last spec)" do

  let(:sunny_airport) {Airport.new} #{double :airport, weather_condition: :sunny}
  before {allow(sunny_airport).to receive(:weather_condition).and_return(:sunny)}
  let(:airspace) {Airspace.new}
  let(:fleet) { Array.new(6) { Plane.new } }

  it 'should allow all planes to land and all planes to take off' do
    6.times {airspace.accept(Plane.new)}
    while airspace.number_planes > 0 do
      sunny_airport.land(airspace.planes[0], airspace)
    end
    expect(sunny_airport.number_planes).to eq(6)
    sunny_airport.planes.each do | plane |
      expect(plane).not_to be_flying
    end
    while sunny_airport.number_planes > 0 do
      sunny_airport.launch(sunny_airport.planes[0], airspace)
    end 
    expect(airspace.number_planes).to eq(6)
    airspace.planes.each do | plane |
      expect(plane).to be_flying
    end
  end

  # xit 'should allow 6 planes to land and to then take off' do
  #   use fleet concept... 
  # end
   
end