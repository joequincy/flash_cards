class Deck
  def initialize(card_array)
    @cards = card_array
  end
  def cards_in_category(category)
    selection = @cards.select{|card| card.category == category}
  end
  def count
    return @cards.length
  end
end
