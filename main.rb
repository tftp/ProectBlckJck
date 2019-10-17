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
@player = Player.new(name)
@dealer = Diller.new
create_deck_of_cards
loop do
  @player.check
  @dealer.check
  @bank -= 2 * RATE
  @player.change_bank(RATE)
  @dealer.change_bank(RATE)
  mixed_cards
  processing("\nКарты размешиваются")
  @player.add_card select_card
  @player.add_card select_card
  @dealer.add_card select_card
  @dealer.add_card select_card
  @player.points_of_cards SHOW
  @dealer.points_of_cards HIDE
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

  processing("\nПосчет результатов")
  puts "\nВнимание! Результаты!"
  open_cards
  break if check_end_game?
end
puts 'Спасибо за игру!'
