class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
FARE = 3

attr_reader :balance

  def initialize
    @balance = 0
    @in_journey
  end

  def top_up(money)
    raise "Maximum balance is £#{MAXIMUM_BALANCE}!" if allowed?(money)
    @balance += money
    return money
  end

  def deduct
    @balance -= FARE
    return FARE
  end

  def touch_in
    raise "Minimum balance is £#{MINIMUM_BALANCE}!" if minimum_balance?
    @in_journey = true
    in_journey?
  end

  def touch_out
    @in_journey = false
    in_journey?
  end

private

  def allowed?(money)
    new_balance = @balance += money
    new_balance > MAXIMUM_BALANCE
  end

  def in_journey?
    @in_journey == true
  end

  def minimum_balance?
    @balance < MINIMUM_BALANCE
  end
end
