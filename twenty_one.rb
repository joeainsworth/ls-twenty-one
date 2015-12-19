# Deal card deck consisting of 4 suits and 13 values
# Deal the player and dealer two cards
# Only show one of the dealers cards
# Player chooses to hit or stay
# Hit or stay? Until 21 or bust
# Dealer reveals second card
# Hit or stay? Until less than 17 or bust
# Compare the total value of each hand

SUIT  = ['H', 'D', 'C', 'S']
CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def initialize_deck
  deck = []
  SUIT.each do |suit|
    CARDS.each do |card|
      deck << [suit, card]
    end
  end
  deck.shuffle!
end

def deal_card!(deck)
  deck.shift
end

def deal_initial_hand(deck, player_hand, computer_hand)
  2.times do
    player_hand << deal_card!(deck)
    computer_hand << deal_card!(deck)
  end
end

def card_suit(card)
  case card
  when 'H'
    'Hearts'
  when 'D'
    'Diamonds'
  when 'C'
    'Clubs'
  when 'S'
    'Spades'
  end
end

def suit_card(card)
  case card
  when 'J'
    'Jack'
  when 'Q'
    'Queen'
  when 'K'
    'King'
  when 'A'
    'Ace'
  else
    card
  end
end

def cards_in_hand(hand)
  cards = []
  hand.each do |card|
    cards << "#{suit_card(card[1])} of #{card_suit(card[0])}"
  end
  cards
end

def hand_msg(hand)
  cards = cards_in_hand(hand)
  cards[-1] = "and #{cards.last}" if cards.size > 1
  cards.join(', ')
end

deck = initialize_deck
player_hand = []
computer_hand = []

deal_initial_hand(deck, player_hand, computer_hand)
p hand_msg(player_hand)
