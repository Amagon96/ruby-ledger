
class Transaction
  def initialize(date, description, movements)
    @date = date
    @description = description
    @movements = movements
  end

  def date
    @date
  end

  def date=(date)
    @date = date
  end

  def description
    @description
  end

  def description=(description)
    @description = description
  end

  def movements
    @movements
  end

  def movements=(movements)
    @movements = movements
  end
end