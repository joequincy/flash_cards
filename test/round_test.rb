require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end
  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_has_array_for_turns
    assert_equal [], @round.turns
  end

  def test_it_has_a_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_can_take_a_turn
    round = Round.new(@deck)
    assert_instance_of Turn, round.take_turn("Juneau")
  end

  def test_it_turn_has_given_answer
    round = Round.new(@deck)
    assert_equal "Juneau", round.take_turn("Juneau").guess
  end

  def test_it_if_correct_turn_returns_correctly
    round = Round.new(@deck)
    current_turn = round.take_turn("Juneau")
    assert_equal true, current_turn.correct?
  end

  def test_it_if_wrong_turn_returns_correctly
    round = Round.new(@deck)
    current_turn = @round.take_turn("Venus")
    assert_equal false, current_turn.correct?
  end

  def test_it_if_array_of_turns_is_correct
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")
    assert_equal [new_turn], round.turns
  end

  def test_it_if_number_of_correct_answers_is_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    assert_equal 1, round.number_correct
  end

  def test_it_if_number_of_correct_answers_by_category_is_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    assert_equal 1, round.number_correct_by_category(:Geography)
  end

  def test_it_if_percent_of_correct_answers_by_category_is_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")
    assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end

  def test_it_if_percent_of_correct_answers_is_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")
    assert_equal 50.0, round.percent_correct
  end
end
