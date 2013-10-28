def say(msg) 
  puts "-->  #{msg}"
end

def say_to_player1(p1name,msg)
  puts "-->  #{p1name.capitalize}, #{msg}"
end

# Greating the player and getting their name

say "Welcome to Sonya's Blackjack Game!"
say " "
say "What is your name?"
player1_name = gets.chomp
say "Let's Plays Some Blackjack!"

play_again = "Yes"

#Setting up the array of cards and Shuffling

#deck = [ 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, "J", "J", "J", "J", "Q", "Q", "Q", "Q", "K", "K", "K", "K", "A", "A", "A", "A"]
deck = [ "A", "A", "A", "A", "A", 2, 3, 5, "J", 10, 10 ]
deck.shuffle!

until (play_again.capitalize == "No") do
  say " "
  say "***** DEALING CARDS *********"
  say " "
  
  # Dealing the cards

  player1_card1 = deck.pop
  dealer_card1 = deck.pop
  player1_card2 = deck.pop
  dealer_card2 = deck.pop

  # Displaying the cards to the player

  say_to_player1(player1_name, "You have been delt a #{player1_card1} and a #{player1_card2}.")
  say " "
  say "The dealer has been delt one card down that you cannot see and a #{dealer_card2}."
  say " "

  # Caculate the value of each card in the players hand

  if [ 2, 3, 4, 5, 6, 7, 8, 9, 10 ].include?(player1_card1)
      player1_card1_value1 = player1_card1
      player1_card1_value2 = 0
    elsif [ "J", "Q", "K" ].include?(player1_card1.to_s)
      player1_card1_value1 = 10
      player1_card1_value2 = 0
    elsif [ "A" ].include?(player1_card1)
      player1_card1_value1 = 1
      player1_card1_value2 = 11
  end 

  if [ 2, 3, 4, 5, 6, 7, 8, 9, 10 ].include?(player1_card2)
      player1_card2_value1 = player1_card2
      player1_card2_value2 = 0
    elsif [ "J", "Q", "K" ].include?(player1_card2.to_s)
      player1_card2_value1 = 10
      player1_card2_value2 = 0
    elsif [ "A" ].include?(player1_card2)
      player1_card2_value1 = 1
      player1_card2_value2 = 11
  end 

# Calculate the total value of the players hand after the deal

  if ((player1_card1_value2 == 0) and (player1_card2_value2 == 0))
      player1_hand_value1 = (player1_card1_value1 + player1_card2_value1)
      say "The total value in your hand is #{player1_hand_value1}"
    elsif ((player1_card1_value2 >= 0) and (player1_card2_value2 == 0))
      say "You have 1 Ace in your hand!"
      player1_hand_value1 = player1_card1_value1 + player1_card2_value1
      player1_hand_value2 = player1_card1_value2 + player1_card2_value1
      say "The total in your hand can be either #{player1_hand_value1} or #{player1_hand_value2}"
    elsif ((player1_card1_value2 == 0) and (player1_card2_value2 >= 0))
      say "You have 1 Ace in your hand!"
      player1_hand_value1 = player1_card1_value1 + player1_card2_value1
      player1_hand_value2 = player1_card1_value1 + player1_card2_value2
      say "The total in your hand can be either #{player1_hand_value1} or #{player1_hand_value2}"
    elsif ((player1_card1_value2 >= 0) and (player1_card2_value2 >= 0))
      say "You have 2 Aces in your hand!"
      player1_hand_value1 = player1_card1_value1 + player1_card2_value1
      player1_hand_value2 = player1_card1_value1 + player1_card2_value2
      player1_hand_value3 = player1_card1_value2 + player1_card2_value1
      player1_hand_value4 = player1_card1_value2 + player1_card2_value2
      say "The total in your hand can be 2, 12, or 22"
  end

  # Check to See if the player Hit BlackJack

  arr_p1_hand_value = [player1_hand_value1, player1_hand_value2, player1_hand_value3, player1_hand_value4]
  if arr_p1_hand_value.include? 21
    say " "
    say "*** Congradulations, You hit a BlackJack! You Win!! ****"
    say " "
    else
      # Ask if the Player would like a Hit?
      say_to_player1(player1_name,"would you like a hit? Please enter Yes or No")
      player1_hit = gets.chomp

      until ([ "Yes", "No" ].include? player1_hit.capitalize) do
        say_to_player1(player1_name,"Please type Yes or No.")
        player1_hit = gets.chomp
      end

      if player1_hit.capitalize == "Yes"
        player1_card3 = deck.pop
        say "Your next card is #{player1_card3}"
        else 
        say "Ok, your hand is Set"
      end
  end

  
  # See if the player would like to play again

  say_to_player1(player1_name,"Would You like to play Again? Please type yes or no.")
  play_again = gets.chomp

    until ([ "Yes", "No" ].include? play_again.capitalize) do
      say_to_player1(player1_name,"Please type Yes or No.")
      play_again = gets.chomp
    end
  # puts deck
end