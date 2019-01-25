class Turn
  attr_reader :guess, :card
  def initialize(string, card)
    # In order to accept Guesses as correct, even if they're missing
    # capitalization or punctuation, use a Regex to replace all non-word
    # characters (anything that isn't a-z, A-Z, or 0-9) with an empty string,
    # then downcase the whole thing.
    @guess = string.gsub(/[\W]+/,"").downcase
    @card = card
  end
  def correct?
    # As with the Guess above, remove extraneous characters and capitalization
    # from the Answer.
    return @guess == @card.answer.gsub(/[\W]+/,"").downcase
  end
  def feedback
    # Using the Ternary `if` notation to be concise
    # (conditional expression) ? (code to run if true) : (code to run if false)
    return correct? ? "Correct!" : "Incorrect."
  end
end
