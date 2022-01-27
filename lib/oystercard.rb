class Oystercard

  # stations = [] How to make initialize ruby variables

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance  
  attr_reader :entry_stations
  attr_reader :list_of_journeys
  def initialize
    @entry_stations = nil
    @balance = 0
    @in_journey = false
    @list_of_journeys = []
  end

  def top_up(amount)
    if @balance + amount > MAXIMUM_BALANCE
      raise "Maximum balance exceeded"
    else
      @balance += amount
    end 
  end

  def in_journey?
    if @entry_stations = nil
      return true
    else return false
    end
  end

  def touch_in(entry_station)
    @entry_stations = entry_station
    @in_journey = true
  end

  def touch_out(exit_station)
    deduct(1)
    
    @in_journey = false
    
    hash = {entry_station: @entry_station,
    exit_station: exit_station}

    @list_of_journeys.push(hash)
    
    @entry_stations = nil
  end

  private
  def deduct(amount)
    raise "Insufficient funds" if @balance < MINIMUM_BALANCE
    @balance -= amount
  end

end

# card = Oystercard.new
# p card.balance
# card.top_up(10)
# p card.balance
# card.deduct(2)
# p card.balance




