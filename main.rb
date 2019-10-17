
# интерактивный инструмент

# игра начинается с раздачи  карт
# есть банк
# есть карты
# выигрывает игрок у которого сумма очков ближе к 21
# если сумма очков более 21 то он проиграл
# если сумма очков равна, то ничья, деньги возвращаются игрокам
# сумма из банка игры переходит к выигравшему
#
require_relative 'card'
require_relative 'game_mechanics'
require_relative 'player'
require_relative 'diller'
require_relative 'card_options'
require_relative 'menu_processing'

include CardOption
include MenuProcessing

RATE = -10
SHOW = true
HIDE = false

@cards = []
@bank = 0


print 'Желаешь сыграть, странник? Введи своё имя: '
name = gets.chomp
# инициализация игрока
@player = Player.new(name)
# инициализация диллера
@dealer = Diller.new
# создание карточной колоды
create_deck_of_cards
# начало игры
loop do
  # проверяем игроков на туз в рукаве
  @player.check
  @dealer.check
  # банк игры наполняется ставками игрока и диллера
  @bank -= 2 * RATE
  # банк игрока и банк диллера уменьшается
  @player.change_bank(RATE)
  @dealer.change_bank(RATE)

  # размешивание карт?
  mixed_cards
  processing("\nКарты размешиваются")
  # игрок получает 2 карты, диллер получает 2 карты
  @player.add_card select_card
  @player.add_card select_card
  @dealer.add_card select_card
  @dealer.add_card select_card
  # player видит свои карты
  @player.points_of_cards SHOW
  @dealer.points_of_cards HIDE
  # меню выбора игрока: пропустить, добавить, открыть
  # ход диллера: пропустить, добавить
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

  # открытие карт
  # подсчет результатов, объявление победителя
  processing("\nПосчет результатов")
  puts "\nВнимание! Результаты!"
  open_cards
  # предложение сыграть ещё, выход
  break if check_end_game?
end
puts "Спасибо за игру!"
