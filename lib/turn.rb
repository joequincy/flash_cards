class Turn
  def initialize(string, card)
    @guess = string
    @card = card
  end
  def guess
    return @guess
  end
  def card
    return @card
  end
  def correct?
    return @guess == @card.answer
  end
  def feedback
    return self.correct? ? "Correct!" : "Incorrect."
  end
end
