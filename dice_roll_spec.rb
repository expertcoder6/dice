require_relative 'dice_roll'

RSpec.describe Dice do
  let(:six_sided_dice) { Dice.new(6) }
  let(:eight_sided_dice) { Dice.new(8) }

  it 'initializes correct no of edges' do
    expect(six_sided_dice.edges).to eq(6)
    expect(eight_sided_dice.edges).to eq(8)
  end

  it 'rolls a value between 1 and the no of edges' do
    expect(six_sided_dice.roll).to be_between(1, 6)
    expect(eight_sided_dice.roll).to be_between(1, 8)
  end

  it 'returns the correct string' do
    expect(six_sided_dice.to_s).to eq("6-edged die")
    expect(eight_sided_dice.to_s).to eq("8-edged die")
  end
end

RSpec.describe DiceRoller do
  let(:six_sided_dice) { Dice.new(6) }
  let(:eight_sided_dice) { Dice.new(8) }
  let(:twenty_sided_die) { Dice.new(20) }

  it 'initializes with an array of dice' do
    roller = DiceRoller.new([six_sided_dice, eight_sided_dice])
    expect(roller.dice).to eq([six_sided_dice, eight_sided_dice])
  end

  it 'returns a DiceResult data after rolling all dice' do
    roller = DiceRoller.new([six_sided_dice, eight_sided_dice])
    result = roller.roll_all_dice

    expect(result).to be_a(DiceResult)
    expect(result.description).to eq(["6-edged die", "8-edged die"])
    expect(result.values.size).to eq(2)
    expect(result.total).to eq(result.values.sum)
  end
end

RSpec.describe DiceResult do
  let(:result) { DiceResult.new(["6-edged die", "8-edged die"], [3, 7], 10) }

  it 'initializes with the description, values, and total' do
    expect(result.description).to eq(["6-edged die", "8-edged die"])
    expect(result.values).to eq([3, 7])
    expect(result.total).to eq(10)
  end

  it 'returns the string representation' do
    expected_output = "Dice Roll Result: 6-edged die, 8-edged die\nValues: 3, 7\nTotal: 10"
    expect(result.to_s).to eq(expected_output)
  end
end
