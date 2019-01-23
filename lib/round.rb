class Round
  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
  end
  # Accessor methods
  def deck
    return @deck
  end
  def turns
    return @turns
  end
  def current_card
    return @current_card
  end
  # Operation methods
  def take_turn(guess)
    current_turn = Turn.new(guess, @current_card)
    @turns << current_turn
    @current_card = @deck.cards[@turns.length]
    return current_turn
  end
  def number_correct
    count = 0
    @turns.each do |turn|
      if turn.correct?
        count += 1
      end
    end
    return count
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
    return number_correct / @turns.count
  end
  def percent_correct_by_category(category)
    count = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        count += 1
      end
    end
    return number_correct_by_category(category) / count
  end
end
