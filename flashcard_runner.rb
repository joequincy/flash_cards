require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

cards = CardGenerator.new("cards.txt").cards.shuffle!
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  puts "Hello! Before we begin, do you want to choose a category?"
  puts "If not, we will play with all available cards. Please enter 'y' or 'n'"
  if gets.chomp == "y"
    # Offer user a list of categories, then have them type which one they want.
    # Any time the user types a category that doesn't exist, prompt them again
    available_categories = round.deck.list_categories
    selected_category = ""
    while !available_categories.include?(selected_category)
      puts "Which category would you like to play?"
      puts available_categories.join(" | ")
      # Enhancement opportunity: accept responses that don't match capitalization
      selected_category = gets.chomp.to_sym
      if !available_categories.include?(selected_category)
        puts "There are no cards in that category."
      end
    end
    # Create a new deck from the cards that match the selected category
    # then reset the round using just those cards.
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
