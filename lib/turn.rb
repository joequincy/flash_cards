class Turn
  attr_reader :guess, :card
  def initialize(string, card)
    @guess = string.gsub(/[\W]+/,"").downcase
    @card = card
  end
  def correct?
    return @guess == @card.answer.gsub(/[\W]+/,"").downcase
  end
  def feedback
    return self.correct? ? "Correct!" : "Incorrect."
  end
end
