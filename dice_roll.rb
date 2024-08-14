class Dice
  attr_reader :edges

  def initialize(edges)
    @edges = edges
  end

  def roll
    rand(1..edges)
  end

  def to_s
    "#{edges}-edged die"
  end
end

class DiceRoller
  attr_reader :dice

  def initialize(dice)
    @dice = dice
  end

  def roll_all_dice
    results = dice.map(&:roll)
    total = results.sum
    DiceResult.new(dice.map(&:to_s), results, total)
  end
end

class DiceResult
  attr_reader :description, :values, :total

  def initialize(description, values, total)
    @description = description
    @values = values
    @total = total
  end

  def to_s
    "Dice Roll Result: #{description.join(', ')}\nValues: #{values.join(', ')}\nTotal: #{total}"
  end
end
