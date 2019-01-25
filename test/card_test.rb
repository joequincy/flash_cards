require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  end
  def test_it_exists
    assert_instance_of Card, @card_1
  end

  def test_it_has_attributes
    assert_equal "What is the capital of Alaska?", @card_1.question
    assert_equal "Juneau", @card_1.answer
    assert_equal :Geography, @card_1.category
    assert_equal "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @card_2.question
    assert_equal "Mars", @card_2.answer
    assert_equal :STEM, @card_2.category
  end
end
