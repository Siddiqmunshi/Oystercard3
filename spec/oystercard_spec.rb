require "oystercard"

describe Oystercard do

  let(:entry_station) {double :station}
  let(:exit_station) {double :station}

  # entry_station = double("station")

  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "can top up balance" do
    expect{subject.top_up 1}.to change{subject.balance}.by 1
  end

  it 'raises an error if the maximum balance is exceeded' do
    expect{subject.top_up 91}.to raise_error "Maximum balance exceeded"
  end

  # it "can deduct balance" do
  #   subject.top_up(50)
  #   expect{subject.deduct 1}.to change{subject.balance}.by (-1)
  # end 

  it "can tell if user is on journey" do
    expect(subject.in_journey?).to eq false
  end

  it "can touch in" do
    expect(subject.touch_in("")).to eq true
  end

  # it "can touch out" do
  #   subject.top_up(5)
  #   expect(subject.touch_out(exit_station)).to eq false
  # end
  # No longer need this test

  it 'raises an error when insufficient funds in balance' do
    expect{subject.touch_out(exit_station)}.to raise_error "Insufficient funds"
  end

  it 'will deduct from balance on touch out' do
    subject.top_up(10)
    expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
  end

  it "can remember the entry station" do
    subject.touch_in("station")
    expect(subject.entry_stations).to eq "station"
  end

  it "can forget entry station on touch out" do
    subject.top_up(10)
    subject.touch_in("station")
    subject.touch_out(exit_station)
    expect(subject.entry_stations).to eq nil
  end

  it "can " do
    subject.top_up(10)
    subject.touch_in(entry_station)
    expect(subject.in_journey?).to eq false
  end

  it 'can check card has empty list of journeys by default' do
    expect(subject.list_of_journeys).to eq []
  end

  it "checks touch in and out creates one journey" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.list_of_journeys.length).to eq 1
  end


end
