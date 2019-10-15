
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
require_relative 'player'
require_relative 'diller'

RATE = -10

@cards = []
@bank = 0

print 'Желаете сыграть, введите своё имя: '
name = gets.chomp
# инициализация игрока
@player = Player.new(name)
# инициализация диллера
@dealer = Diller.new
# начало игры, банк игры наполняется ставками игрока и диллера

# банк игрока и банк диллера уменьшается
# игрок получает 2 карты, диллер получает 2 карты
# меню выбора игрока: пропустить, добавить, открыть
# ход диллера: пропустить, добавить
# открытие карт
# подсчет результатов, объявление победителя
# предложение сыграть ещё, выход

# создание колоды карт
def create_deck_of_cards
  suit = [9824, 9827, 9829, 9830]
  4.times do |suit_number|
    suit_str = "" << suit[suit_number]
    2.upto(10) do |number|
      name = number.to_s + suit_str
      @cards << Card.new(name, number)
    end
    name = 'J' + suit_str
    @cards << Card.new(name, 10)
    name = 'Q' + suit_str
    @cards << Card.new(name, 10)
    name = 'K' + suit_str
    @cards << Card.new(name, 10)
    name = 'T' + suit_str
    @cards << Card.new(name, 11)
  end
end
