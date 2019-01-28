class Round
  attr_reader :deck, :current_card, :turns
  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
  end
  def categories
    @deck.list_categories
  end
  def take_turn(guess)
    current_turn = Turn.new(guess, @current_card)
    @turns << current_turn
    # Since array indexes are zero-based, the length of the Turn array
    # will now equal the index of the next card in the Deck
    @current_card = @deck.cards[@turns.length]
    return current_turn
  end
  def number_correct
    # count = 0
    # @turns.each do |turn|
    #   if turn.correct?
    #     count += 1
    #   end
    # end
    # return count
    temp = @turns.inject(0) do |count, turn|
      turn.correct? ? count + 1 : count
    end
  end
  def number_correct_by_category(category)
    count = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        count += 1
      end
    end
    return count
  end
  def percent_correct
    return number_correct * 100.0 / @turns.count
  end
  def percent_correct_by_category(category)
    return number_correct_by_category(category) * 100.0 / @deck.cards_in_category(category).length
  end
end
