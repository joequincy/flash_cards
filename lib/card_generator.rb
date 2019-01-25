class CardGenerator
  attr_reader :lines
  def initialize(filename)
    @lines = IO.readlines(filename)
  end
  def cards
    card_array = []
    @lines.each do |line|
      # Note: Originally I didn't have the Question and Answer strings wrapped
      # in quotes in the cards.txt file, and used string.split(",") to get an
      # Array of the three parts. If any question has a comma, however, this
      # causes issues. I refactored to perform matching as described below,
      # since the divinding sequences of characters are more unique, and unlikely
      # to appear by mistake in the Questions or Answers.

      # Matches everything between the start of the line and a `","` sequence of
      # characters.
      question = line.match(/^\"(.*)\"\,\"/)[1]
      # Matches everything between a `","` sequence and `",` sequence of
      # characters.
      answer = line.match(/\,\"(.*)\"\,/)[1]
      # Matches a-z, A-Z, and 0-9 characters (symbols are limited to these) as
      # well as spaces between a `",` sequence of characters and the end of the
      # line. Since spaces aren't allowed in Symbols, condense and camel-case
      # multi-word categories.
      category = line.match(/\"\,([\w ]*)$/)[1]
      if category.include?(" ")
        words = category.split(" ")
        words.each do |word|
          word.capitalize!
        end
        category = words.join("")
      end
      card_array << Card.new(question, answer, category.to_sym)
    end
    return card_array
  end
end
