class CardGenerator
  attr_reader :lines
  def initialize(filename)
    @lines = IO.readlines(filename)
  end
  def cards
    card_array = []
    @lines.each do |line|
      # Split each comma-separated line into an array.
      # Note: will cause problems if any questions have commas in them.
      # Enhancement opportunity: Store question and answers as strings wrapped
      # in double-quotes, and use string.match to get each portion
      # instead of string.split
      card_details = line.split(",")
      card_category = card_details[2].gsub(/[\W]+/,"").to_sym
      card_array << Card.new(card_details[0], card_details[1], card_category)
    end
    return card_array
  end
end
