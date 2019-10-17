# frozen_string_literal: true

require_relative 'card'
require_relative 'game_mechanics'
require_relative 'player'
require_relative 'diller'
require_relative 'card_options'
require_relative 'menu_processing'

RATE = -10
SHOW = true
HIDE = false

@cards = []
@bank = 0

print 'Желаешь сыграть, странник? Введи своё имя: '
name = gets.chomp
# initialization of the player
@player = Player.new(name)
# initialization of the dealer
@dealer = Diller.new
# creating a card deck
create_deck_of_cards
# game start
loop do
  # check players for
  @player.check
  @dealer.check
  #  the Bank of the game is filled
  @bank -= 2 * RATE
  # the player's Bank and the dealer's Bank decrease
  @player.change_bank(RATE)
  @dealer.change_bank(RATE)

  # stirring the cards
  mixed_cards
  processing("\nКарты размешиваются")
  # the player gets 2 cards, the dealer gets 2 cards
  @player.add_card select_card
  @player.add_card select_card
  @dealer.add_card select_card
  @dealer.add_card select_card
  # player sees his cards
  @player.points_of_cards SHOW
  @dealer.points_of_cards HIDE
  # the selection menu of the player:
  loop do
    menu_for_player
    case gets.chomp
    when '1'
      choise_of_dealer
    when '2'
      @player.add_card select_card
      choise_of_dealer
      break
    when '3'
      choise_of_dealer
      break
    end
  end

  # counting results, announcement of the winner
  processing("\nПосчет результатов")
  puts "\nВнимание! Результаты!"
  open_cards
  # offer to play again, exit
  break if check_end_game?
end
puts 'Спасибо за игру!'
