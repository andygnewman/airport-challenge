require 'airport'

describe Airport do
  
  let(:airport_sunny) {Airport.new}
  before {allow(airport_sunny).to receive(:weather_condition).and_return(:sunny)}
  let(:airport_stormy) {Airport.new}
  before {allow(airport_stormy).to receive(:weather_condition).and_return(:stormy)}
  let(:plane) {Plane.new}
  let(:airspace) {Airspace.new}

  context 'taking off and landing' do

  
    it 'can land a plane' do
      airspace.accept(plane)
      airport_sunny.land(plane, airspace)
      expect(airport_sunny.number_planes).to eq(1)
      expect(plane).not_to be_flying
      expect(airspace.number_planes).to eq(0)
    end

    it 'can launch a plane (take off)' do
      plane.land!
      airport_sunny.accept(plane)
      airport_sunny.launch(plane, airspace)
      expect(airspace.number_planes).to eq(1)
      expect(plane).to be_flying
      expect(airport_sunny.number_planes).to eq(0)
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      6.times{ airport_sunny.accept(Plane.new) }
      expect(lambda {airport_sunny.land(plane, airspace)}).to raise_error(RuntimeError, 'Plane cannot land: Airport Full')
    end

  end

  context 'weather conditions' do

    it 'should not allow a plane to take off when there is stormy weather' do
      plane.land!
      airport_stormy.accept(plane)
      expect(airport_stormy.number_planes).to eq(1)
      expect(lambda {airport_stormy.launch(plane, airspace)}).to raise_error(RuntimeError, 'Cannot complete action: Stormy Weather')
      expect(airport_stormy.number_planes).to eq(1)
    end

    it 'should not allow a plane to land when there is stormy weather' do
      airspace.accept(plane)
      expect(lambda {airport_stormy.land(plane, airspace)}).to raise_error(RuntimeError, 'Cannot complete action: Stormy Weather')
      expect(airspace.number_planes).to eq(1)
      expect(airport_stormy.number_planes).to eq (0)
    end

  end

end



