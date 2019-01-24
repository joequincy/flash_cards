class Deck
  attr_reader :cards
  def initialize(card_array)
    @cards = card_array
  end
  def cards_in_category(category)
    return @cards.select{|card| card.category == category}
  end
  def count
    return @cards.length
  end
  def list_categories
    categories = []
    @cards.each do |card|
      if !categories.include?(card.category)
        categories << card.category
      end
    end
    return categories
  end
end
