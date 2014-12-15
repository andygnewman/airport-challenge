
require 'plane'


describe Plane do
  
  let(:plane) {Plane.new}
  let(:sunny_airport) { Airport.new }
  
  before { allow(sunny_airport).to receive(:weather_condition).and_return(:sunny)}
  before { allow(sunny_airport).to receive(:airport_full_check).and_return(false)}
  before { allow(sunny_airport).to receive(:check_plane_at_airport).with(plane).and_return(true)}
    
  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'has not got flying status when landed by the plane' do 
    plane.land!
    expect(plane).not_to be_flying
  end

  it 'has not got flying status when landed by the airport' do  
    sunny_airport.land(plane)
    expect(plane).not_to be_flying
  end

  it 'has a flying status when launched by the plane' do
    plane.fly!
    expect(plane).to be_flying
  end

  it 'has a flying status when launched by the airport' do
    plane.land!
    sunny_airport.launch(plane)
    expect(plane).to be_flying
  end

  

end
  