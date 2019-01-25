require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end
  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal @cards, @deck.cards
  end

  def test_it_counts_correctly
    assert_equal 3, @deck.count
    new_deck = Deck.new([@card_1, @card_2])
    assert_equal 2, new_deck.count
  end

  def test_it_returns_cards_by_category
    assert_equal [@card_1], @deck.cards_in_category(:Geography)
    assert_equal [@card_2,@card_3], @deck.cards_in_category(:STEM)
    assert_equal [], @deck.cards_in_category(:PopCulture)
  end

  def test_it_can_list_categories
    assert_equal [:Geography, :STEM], @deck.list_categories
    new_card = Card.new("Who is the current star of Doctor Who?", "Jodie Whittaker", :Entertainment)
    new_deck = Deck.new([@card_1, @card_2, new_card])
    assert_equal [:Geography, :STEM, :Entertainment], new_deck.list_categories
  end
end
