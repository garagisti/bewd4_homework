class Account

attr_accessor :balance

  def initialize(opening_balance)
    @balance = opening_balance
  end

  def withdraw(amount)
      @balance = @balance - account if can_withdraw?(amount)
  end

  def can_withdraw(amount)
    amount <= @balance
  end

end