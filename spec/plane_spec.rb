
require 'plane'


describe Plane do
  let(:plane) {Plane.new}
  let(:sunny_airport) { Airport.new }
  before { allow(sunny_airport).to receive(:weather_condition).and_return(:sunny)}
  let(:airspace) { Airspace.new }
  let(:airport_dble) {double :airport_dble, airport_full_check: false, weather_check: nil}
  before { allow(airport_dble).to receive(:accept).with(plane)}
  before { allow(airport_dble).to receive(:land).with(plane, airspace_dble)}
  let(:airspace_dble) {double :airspace_dble}
  before { allow(airspace_dble).to receive(:release).with(plane)}

  def plane_in_airport(plane)
    plane.land!
    sunny_airport.accept(plane)
  end

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'has a landed status when it has been landed' do
    plane.land!
    expect(plane).not_to be_flying
  end

  it 'has a flying status when launched' do
    plane.fly!
    expect(plane).to be_flying
  end

end

# double an airport and airspace to allow it to launch / land and check status
# can't double the airport as aiport.land is controlling the flying status method call

  # it 'has a landed status when landed by airport' do
  #   airport_dble.land(plane, airspace_dble)
  #   expect(plane).not_to be_flying
  # end
  
# old tests, but too complex as relying on other objects to test plane

  # it 'should move from airport to airspace on take off' do
  #   plane_in_airport(plane)
  #   expect(sunny_airport.number_planes).to eq(1)
  #   sunny_airport.launch(plane, airspace)
  #   expect(sunny_airport.number_planes).to eq(0)
  #   expect(airspace.number_planes).to eq(1)
  # end

  # it 'changes its status to flying after taking of' do
  #   plane_in_airport(plane)
  #   sunny_airport.launch(plane, airspace)
  #   expect(plane).to be_flying
  # end

  