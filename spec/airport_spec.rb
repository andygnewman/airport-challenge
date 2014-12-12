require 'airport'

describe Airport do
  
  let(:airport) { Airport.new}
  let(:plane) {Plane.new}
  let(:airspace) {Airspace.new}

  context 'taking off and landing' do

    it 'can land a plane' do
      airspace.accept(plane)
      airport.accept(plane)
      airspace.release(plane)
      plane.land!
      expect(airport.number_planes?).to eq(1)
      expect(plane).not_to be_flying
      expect(airspace.number_planes?).to eq(0)
    end

    it 'can launch a plane (take off)' do
      plane.land!
      airport.accept(plane)
      airspace.accept(plane)
      plane.fly!
      airport.release(plane)
      expect(airspace.number_planes?).to eq(1)
      expect(plane).to be_flying
      expect(airport.number_planes?).to eq(0)
    end

  end
end

# context 'taking off and landing' do

#     it 'a plane can land' do

#     end

#     it 'a plane can take off' do

#     end
#   end

#   context 'traffic control' do

#     it 'a plane cannot land if the airport is full' do

#     end

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

#     context 'weather conditions' do

#       it 'a plane cannot take off when there is a storm brewing' do

#       end

#       it 'a plane cannot land in the middle of a storm' do

#       end
#     end
#   end
# end