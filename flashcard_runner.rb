require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

cards = []
cards << Card.new("Who is the current star of Doctor Who?", "Jodie Whittaker", :Entertainment)
cards << Card.new("What video game series stars a Runner named Faith?", "Mirror's Edge", :Entertainment)
cards << Card.new("What is the largest continent on Earth by area?", "Asia", :Geography)
cards << Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :Entertainment)
cards << Card.new("What progamming language are we using in this Mod?", "Ruby", :Technology)

deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
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
