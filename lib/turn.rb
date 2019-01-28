class Turn
  attr_reader :guess, :card
  def initialize(string, card)
    @guess = string
    @card = card
  end
  def correct?
    # In order to accept Guesses as correct, even if they're missing
    # capitalization or punctuation, use a Regex to replace all non-word
    # characters (anything that isn't a-z, A-Z, or 0-9) with an empty string,
    # then downcase the whole thing. Same with Answer.
    return @guess.gsub(/[\W]+/,"").downcase == @card.answer.gsub(/[\W]+/,"").downcase
  end
  def feedback
    # Using the Ternary `if` notation to be concise
    # (conditional expression) ? (code to run if true) : (code to run if false)
    return correct? ? "Correct!" : "Incorrect."
  end
end
