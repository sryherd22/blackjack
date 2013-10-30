# Interactive Command Line BlackJack Game

def say(msg) 
  puts "-->  #{msg}"
end

def say_to_player1(p1name,msg)
  puts "-->  #{p1name.capitalize}, #{msg}"
end

# Defining Method to Calculate the Total of a Hand
# Cards will be inputed in this method (nested array - suite first): [['H', '3'], [S, 'Q'], ....]

def calculate_total(cards)
  arr = cards.map{ |e| e[1]}
  
  total = 0
  arr.each do |value|
    if value == 'Ace'
      total += 11
    elsif value.to_i == 0
      total += 10
    elsif total += value.to_i
    end
  end  

  # Identify how may aces we have and correct for Aces 
  arr.select{|e| e == "Ace"}.count.times do
    total -= 10 if total > 21
  end

  total
end

# ask the player if they would like to hit or stay

$busted = "No"

def hit_or_stay
  say "What would you like to do 1) Hit 2) Stay"
  choice = gets.chomp

  until ([ "1", "2" ].include? choice) do
    say "Please type 1 for Hit or 2 for Stay."
    input = gets.chomp
  end
  choice
end

# Greating the player and getting their name

say "Welcome to Sonya's Blackjack Game!"
say " "
say "What is your name?"
player1_name = gets.chomp
say "Hi #{player1_name.capitalize}, Let's Plays Some Blackjack!"

#Setting up the array of cards and Shuffling

suits = [ 'Hearts', 'Dimonds', 'Spades', 'Clubs' ]
cards = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
deck = suits.product(cards)
deck.shuffle!

# Setting up loop so that player can play multiple times

play_again = "Yes"

until (play_again.capitalize == "No") do
  say " "
  say "***** DEALING CARDS *********"
  say " "
  
  # Dealing the cards

  player1_cards = []
  dealer_cards = []

  player1_cards << deck.pop
  dealer_cards << deck.pop
  player1_cards << deck.pop
  dealer_cards << deck.pop

  #puts " "
  #puts player1_cards.to_s
  #puts dealer_cards.to_s

  # Calculating the Total of the dealers hand and the players hand

  player1_total = calculate_total(player1_cards)
  dealer_total = calculate_total(dealer_cards)

  #puts " "
  #puts "Dealer Total:  #{dealer_total}"
  #puts " "

  # Displaying the cards to the player

  say_to_player1(player1_name,"You have been delte the following cards: #{player1_cards[0]} and #{player1_cards[1]}")
  say "Your Current Total: #{player1_total}."
  say " "
  say "The dealer has been delt one HIDDEN card and a #{dealer_cards[1]}."
  say " "

  # Check to See if the player Hit BlackJack

  if player1_total == 21
    say "Congradulations #{player1_name}, you hit BlackJack!!"
      if dealer_total == 21
        say "Unfortunatly, so did the dealer, so you push"
      else say "You Win!!"
      end

  # See if the user would like to double down

  # See if the user would like to Split

  # Let the Player play out their hand

  else
    player1_choice = hit_or_stay

    until player1_choice == "2"
      player1_cards << deck.pop
      say "Your next card is a #{player1_cards.last}"
      player1_total = calculate_total(player1_cards)
      say "Your Current Total: #{player1_total}"
        if player1_total == "21"
          say " "
          say "Congradulations, you currently have 21 exactly in your hand"
          say "Let's see what the dealer does!"
          say " "
          player1_choice = "2"
        elsif player1_total >= 22 
          say " "
          say "Sorry, YOU BUSTED!!"
          player1_choice = "2"
          $busted = "Yes"
        else
          player1_choice = hit_or_stay
        end
    end
  end  

  # Finish the dealers hand

  if $busted == "Yes"
    say "Gamd Over... Better luck next time"
    say " "
  elsif dealer_total == 21
    say "The dealers HIDDEN card was #{dealer_cards[0]} and he had a #{dealer_cards[1]} on the table"
    say "The Dealer hit BLACKJACK!"
    say "Sorry... You lose!"
  else
    say "The HIDDEN card in the dealers had is a #{dealer_cards[0]}."
    say "The card the dealer had on the table was a #{dealer_cards[1]}."
    say " "
    say "DEALERS CURRENT TOTAL: #{dealer_total}"
    say " "
      until dealer_total >= 16  do
        say "The dealer must take a hit"
        say " "
        dealer_cards << deck.pop
        dealer_total = calculate_total(dealer_cards)
        say "The dealer was delta a #{dealer_cards.last}."
        say " "
        say "DEALERS CURRENT TOTAL: #{dealer_total}" 
        say " "
      end
    if dealer_total >= 22
      say "The dealer BUSTER with at total of #{dealer_total}."
      say " "
      say "Congradulations #{player1_name.capitalize}... YOU WIN!!"
    else
      say "You have a total of #{player1_total} and the dealer has a total of #{dealer_total}."
      say " "
      if dealer_total >= player1_total
        say "Sorry, you lose!"
      else
        say "Congradulations #{player1_name.capitalize}... YOU WIN!!"
      end
    end
  end

  # See if the player would like to play again

  say " "
  say_to_player1(player1_name,"Would You like to play Again? Please type yes or no.")
  play_again = gets.chomp

    until ([ "Yes", "No" ].include? play_again.capitalize) do
      say_to_player1(player1_name,"Please type Yes or No.")
      play_again = gets.chomp
    end

  if play_again.capitalize == "Yes"
    $busted = "No"
    say " "
    say " "
    say " "
    say "******** STARTING NEW HAND ********"
    say " "
  else
  end
  # puts deck

end