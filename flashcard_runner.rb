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
