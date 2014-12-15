require 'airport'
require 'plane'

describe "The grand finale (last spec)" do

  let(:sunny_airport) {Airport.new}
  before {allow(sunny_airport).to receive(:weather_condition).and_return(:sunny)}
  let(:fleet) { Array.new(6) { Plane.new } }

  it 'should land all 6 planes and subsequently launch all 6' do
    fleet.each { | plane | sunny_airport.land(plane) }
    fleet.each { | plane | expect(plane).not_to be_flying }
    fleet.each { | plane | sunny_airport.launch(plane) }
    fleet.each { | plane | expect(plane).to be_flying }
  end
   
end