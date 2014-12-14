# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

# Not happy with these tests - they're covered in airport tests and anything less seems too simplistic

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
 