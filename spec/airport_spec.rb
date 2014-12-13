require 'airport'

describe Airport do
  
  let(:airport) { Airport.new}
  let(:plane) {Plane.new}
  let(:airspace) {Airspace.new}

  context 'taking off and landing' do

    it 'can land a plane' do
      airspace.accept(plane)
      airport.land(plane, airspace)
      expect(airport.number_planes).to eq(1)
      expect(plane).not_to be_flying
      expect(airspace.number_planes).to eq(0)
    end

    it 'can launch a plane (take off)' do
      plane.land!
      airport.accept(plane)
      airport.launch(plane, airspace)
      expect(airspace.number_planes).to eq(1)
      expect(plane).to be_flying
      expect(airport.number_planes).to eq(0)
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      5.times{ airport.accept(Plane.new) }
      expect(lambda { airport.land(plane, airspace) }).to raise_error(RuntimeError, 'Plane cannot land: Airport Full')
    end

  end

  context 'weather conditions' do

# This will require stubbing to stop the random return of the weather.

#die = double('die')
#die.stub(:roll).and_return(2)

    let(:airport_dble) { double('airport_dble', :stormy_weather? => true)}

    xit 'should not allow a plane to take off when there is stormy weather' do
      allow(airport_dble).to receive(:take_off_weather_check)
      airport_dble.stub(:take_off_weather_check).and_return(raise "Plane cannot take off: Stormy Weather")
      expect(airport_dble).to be_stormy_weather
      expect(lambda {airport_dble.take_off_weather_check}).to raise_error(RuntimeError, 'Plane cannot take off: Stormy Weather')
      # the plane cannot take off and must remain in the airport
    end

    xit 'should not all a plane to land when there is stormy weather' do
      pending
      # the plane can not land, and must not be in the airport
    end

  end

end