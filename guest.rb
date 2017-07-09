class Guest

  attr_reader :name

  def initialize(name, monies)
    @name = name
    @monies = monies
  end

  def get_monies
    @monies
  end

  def pay_entry_fee(entry_fee)
    @monies >= entry_fee ? @monies -= entry_fee : 'Insufficient monies'
  end

end