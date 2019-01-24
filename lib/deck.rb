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
  def cards
    return @cards
  end
  def list_categories
    categories = []
    @cards.each do |card|
      if !categories.include?(card.category)
        categories << card.category
      end
    end
  end
end
