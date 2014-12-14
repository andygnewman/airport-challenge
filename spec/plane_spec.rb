
require 'plane'


describe Plane do

  let(:plane) { Plane.new }
  let(:sunny_airport) { Airport.new }
  before { allow(sunny_airport).to receive(:weather_condition).and_return(:sunny)}
  let(:airspace) { Airspace.new }

  def plane_in_airport(plane)
    plane.land!
    sunny_airport.accept(plane)
  end

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'has a flying status when in the air' do
    airspace.accept(plane)
    expect(plane).to be_flying
  end

  it 'has a landed status when in the airport' do
    airspace.accept(plane)
    sunny_airport.land(plane, airspace)
    expect(plane).not_to be_flying
  end

  it 'should move from airport to airspace on take off' do
    plane_in_airport(plane)
    expect(sunny_airport.number_planes).to eq(1)
    sunny_airport.launch(plane, airspace)
    expect(sunny_airport.number_planes).to eq(0)
    expect(airspace.number_planes).to eq(1)
  end

  it 'changes its status to flying after taking of' do
    plane_in_airport(plane)
    sunny_airport.launch(plane, airspace)
    expect(plane).to be_flying
  end
end 