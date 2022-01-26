require "oystercard"

describe Oystercard do
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
    expect(subject.touch_in).to eq true
  end

  it "can touch out" do
    subject.top_up(5)
    expect(subject.touch_out).to eq false
  end

  it 'raises an error when insufficient funds in balance' do
    expect{subject.touch_out}.to raise_error "Insufficient funds"
  end

  it 'will deduct from balance on touch out' do
    subject.top_up(10)
    expect{subject.touch_out}.to change{subject.balance}.by(-1)
  end

end
