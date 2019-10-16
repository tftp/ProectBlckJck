
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

include CardOption

RATE = -10

@cards = []
@bank = 0


print 'Желаете сыграть, введите своё имя: '
name = gets.chomp
# инициализация игрока
@player = Player.new(name)
# инициализация диллера
@dealer = Diller.new
# создание карточной колоды
create_deck_of_cards
# начало игры, банк игры наполняется ставками игрока и диллера
@bank -= 2 * RATE
# банк игрока и банк диллера уменьшается
@player.change_bank(RATE)
@dealer.change_bank(RATE)

# размешивание карт?

# игрок получает 2 карты, диллер получает 2 карты
@player.add_card select_card
@player.add_card select_card
@dealer.add_card select_card
@dealer.add_card select_card
# меню выбора игрока: пропустить, добавить, открыть
# ход диллера: пропустить, добавить
# открытие карт
# подсчет результатов, объявление победителя
# предложение сыграть ещё, выход

# создание колоды карт
