require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

cards = []
cards << Card.new("Who is the current star of Doctor Who?", "Jodie Whittaker", :Entertainment)
cards << Card.new("What video game series stars a Runner named Faith?", "Mirror's Edge", :Entertainment)
cards << Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :Entertainment)
cards << Card.new("What genre of music is the artist 'Skrillex' best known for?", "Dubstep", :Entertainment)
cards << Card.new("What is the surname of the author of the Lord of the Rings book trilogy?", "Tolkein", :Entertainment)
cards << Card.new("What is the largest continent on Earth by area?", "Asia", :Geography)
cards << Card.new("What country has the most natural lakes?", "Canada", :Geography)
cards << Card.new("What country is Machu Picchu loacated in?", "Peru", :Geography)
cards << Card.new("Which U.S. state has the highest number of active volcanoes?", "Alaska", :Geography)
cards << Card.new("What is the largest country in South America by area?", "Brazil", :Geography)
cards << Card.new("What progamming language are we using in this Mod?", "Ruby", :Technology)
cards << Card.new("What is the name of the company that makes the Firefox web browser?", "Mozilla", :Technology)
cards << Card.new("Which is larger: a petabyte or an exabyte?", "exabyte", :Technology)
cards << Card.new("What does 'LAN' stand for?", "Local Area Network", :Technology)
cards << Card.new("What company makes the popular TI-83 graphing calculator?", "Texas Instruments", :Technology)
cards << Card.new("Which human-made object has traveled farthest from Earth?", "Voyager 1", :Space)
cards << Card.new("What is the largest moon in the Solar System?", "Ganymede", :Space)
cards << Card.new("Who was the first person to use telescopes to look at celestial bodies?", "Galileo", :Space)
cards << Card.new("What is the name of the rocket that launched a Tesla Roadster into space?", "Falcon Heavy", :Space)
cards << Card.new("Which year did the first human land on the moon?", "1969", :Space)
cards.shuffle!

deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  puts "Hello! Before we begin, do you want to choose a category?"
  puts "If not, we will play with all available cards. Please enter 'y' or 'n'"
  if gets.chomp == "y"
    available_categories = round.deck.list_categories
    selected_category = ""
    while !available_categories.include?(selected_category)
      puts "Which category would you like to play?"
      puts available_categories.join(" | ")
      selected_category = gets.chomp.to_sym
      if !available_categories.include?(selected_category)
        puts "There are no cards in that category."
      end
    end
    filtered_deck = Deck.new(round.deck.cards_in_category(selected_category))
    round = Round.new(filtered_deck)
  end

  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "--------------------------------------------------------------"
  while round.turns.length < round.deck.count do
    puts "This is card number #{round.turns.length + 1} of #{round.deck.count}"
    puts "Question: #{round.current_card.question}"
    puts round.take_turn(gets.chomp).feedback
  end
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct.to_i}%."
  round.deck.list_categories.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category).to_i}%"
  end
end

start(round)
