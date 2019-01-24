class Turn
  attr_reader :guess, :card
  def initialize(string, card)
    @guess = string
    @card = card
  end
  def correct?
    return @guess == @card.answer
  end
  def feedback
    return self.correct? ? "Correct!" : "Incorrect."
  end
end
