require 'plane_container'

class PlaneHolder; include PlaneContainer; end

describe PlaneContainer do

  let(:plane_container) {PlaneHolder.new}
  let(:plane_dble) {double :plane}
  
  it 'should accept a plane' do
    plane_container.accept(plane_dble)
    expect(plane_container.number_planes).to eq(1)
  end

  it 'should know how many planes it has' do
    4.times {plane_container.accept(plane_dble)}
    expect(plane_container.number_planes).to eq(4)
  end

  it 'should release a plane' do
    plane_container.accept(plane_dble)
    plane_container.release(plane_dble)
    expect(plane_container.number_planes).to eq(0)
  end

end