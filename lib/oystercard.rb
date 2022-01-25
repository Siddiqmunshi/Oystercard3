class Oystercard
  MAXIMUM_BALANCE = 90
attr_reader :balance  
def initialize
  @balance = 0
end

def top_up(amount)
@balance += amount

if @balance > MAXIMUM_BALANCE
  raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded"
end 


end

end
