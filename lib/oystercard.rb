class Oystercard

  MAXIMUM_BALANCE = 90
attr_reader :balance  

def initialize
  @balance = 0
  @in_journey = false
end

def top_up(amount)
@balance += amount
if @balance > MAXIMUM_BALANCE
  raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded"
end 
end

def deduct(amount)
@balance -= amount
end

def in_journey?
  @in_journey
end

def touch_in
  @in_journey = true
end

def touch_out
  @in_journey = false
end

end


