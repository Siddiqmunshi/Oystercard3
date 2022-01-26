class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance  

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    if @balance + amount > MAXIMUM_BALANCE
      raise "Maximum balance exceeded"
    else
      @balance += amount
    end 
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    deduct(1)
    @in_journey = false
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




