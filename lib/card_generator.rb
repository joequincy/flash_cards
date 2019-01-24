class CardGenerator
  attr_reader :lines
  def initialize(filename)
    @lines = IO.readlines(filename)
  end
  def cards
    card_array = []
    @lines.each do |line|
      card_details = line.split(",")
      card_category = card_details[2].match(/\:(\w+)/)[1].to_sym
      card_array << Card.new(card_details[0], card_details[1], card_category)
    end
    return card_array
  end
end
