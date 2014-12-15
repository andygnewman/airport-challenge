require 'airport'

describe Airport do
  
  let(:airport_sunny) {Airport.new}
  before {allow(airport_sunny).to receive(:weather_condition).and_return(:sunny)}
  let(:airport_stormy) {Airport.new}
  before {allow(airport_stormy).to receive(:weather_condition).and_return(:stormy)}
  let(:plane_dble) {double :plane_dble, fly!: true, land!: false}

  context 'taking off and landing' do

    it 'can land a plane' do
      airport_sunny.land(plane_dble)
      expect(airport_sunny.number_planes).to eq(1)
    end

    it 'can launch a plane (take off)' do
      airport_sunny.land(plane_dble)
      airport_sunny.launch(plane_dble)
      expect(airport_sunny.number_planes).to eq(0)
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      6.times{ airport_sunny.land(plane_dble) }
      expect(lambda {airport_sunny.land(plane_dble)}).to raise_error(RuntimeError, 'Plane cannot land: Airport Full')
    end

  end

  context 'weather conditions' do

    it 'should not allow a plane to take off when there is stormy weather' do
      airport_stormy.accept(plane_dble)
      expect(lambda {airport_stormy.launch(plane_dble)}).to raise_error(RuntimeError, 'Cannot complete action: Stormy Weather')
    end

    it 'should not allow a plane to land when there is stormy weather' do
      expect(lambda {airport_stormy.land(plane_dble)}).to raise_error(RuntimeError, 'Cannot complete action: Stormy Weather')
    end

  end

  context 'mulitple airports' do
    
    it 'should not allow a plane to take off if plane is not at the airport' do
      expect( lambda{airport_sunny.launch(plane_dble)}).to raise_error(RuntimeError, 'Cannot launch: plane not at airport')
    end

  end

end



