require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test
  def setup
    @cards = []
    @cards << Card.new("Who is the current star of Doctor Who?", "Jodie Whittaker", :Entertainment)
    @cards << Card.new("What video game series stars a Runner named Faith?", "Mirror's Edge", :Entertainment)
    @cards << Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :Entertainment)
    @cards << Card.new("What genre of music is the artist 'Skrillex' best known for?", "Dubstep", :Entertainment)
    @cards << Card.new("What is the surname of the author of the Lord of the Rings book trilogy?", "Tolkein", :Entertainment)
    @cards << Card.new("What is the largest continent on Earth by area?", "Asia", :Geography)
    @cards << Card.new("What country has the most natural lakes?", "Canada", :Geography)
    @cards << Card.new("What country is Machu Picchu loacated in?", "Peru", :Geography)
    @cards << Card.new("Which U.S. state has the highest number of active volcanoes?", "Alaska", :Geography)
    @cards << Card.new("What is the largest country in South America by area?", "Brazil", :Geography)
    @cards << Card.new("What progamming language are we using in this Mod?", "Ruby", :Technology)
    @cards << Card.new("What is the name of the company that makes the Firefox web browser?", "Mozilla", :Technology)
    @cards << Card.new("Which is larger: a petabyte or an exabyte?", "exabyte", :Technology)
    @cards << Card.new("What does 'LAN' stand for?", "Local Area Network", :Technology)
    @cards << Card.new("What company makes the popular TI-83 graphing calculator?", "Texas Instruments", :Technology)
    @cards << Card.new("Which human-made object has traveled farthest from Earth?", "Voyager 1", :Space)
    @cards << Card.new("What is the largest moon in the Solar System?", "Ganymede", :Space)
    @cards << Card.new("Who was the first person to use telescopes to look at celestial bodies?", "Galileo", :Space)
    @cards << Card.new("What is the name of the rocket that launched a Tesla Roadster into space?", "Falcon Heavy", :Space)
    @cards << Card.new("Which year did the first human land on the moon?", "1969", :Space)
  end
  def test_it_imports_cards
    cards = CardGenerator.new("cards.txt").cards
    cards.each_with_index do |card, index|
      assert_equal @cards[index].question, card.question
      assert_equal @cards[index].answer, card.answer
      assert_equal @cards[index].category, card.category
    end
  end
end
