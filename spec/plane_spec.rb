# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

require 'plane'

describe Plane do 
  
  let(:plane) { Plane.new }

  it 'should have a status of flying when created' do
    expect(plane).to be_flying
  end

  it 'should have a flying status when in the air' do
    plane.land!
    plane.fly!
    expect(plane).to be_flying
  end

end
 

  # it 'should be able to take off' do
  #   expect(plane).not_to be_flying
  #   expect(plane).to be_flying
  # end

  # it 'should change its status to flying after taking off' do
  #   expect(airspace.planes(plane)).to be_flying
  # end

  








  # it 'should be able to land' do
  #   expect(airport.planes(plane)).to be_landed
  #   expect(airport.planes).to include(plane)
  # end


  # it "should be at the back of the queue if refused permission to land" do
  #   expect(airspace.planes[last_in_array]).to eq(plane)
  #   expect(plane[:landing_attempts]).to eq(1)
  # end
