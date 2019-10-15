class Player
# есть банк пользователя
# у пользователя есть имя
# первая раздача по 2 карты
# видит сумму своих очков
# автоматическая ставка в банк игры
# первый ход пользователя выбор: пропустить, добавить карту, открыть карты
# может быть добавлена только одна карт
# по достижении 3 карт карты вскрываются автоматически
# когда карты открываются игрок видит карты диллера и их сумму очков и результат игры
  attr_accessor :bank, :cards

  def initialize(name)
    @name = name
    @cards = []
    @bank = 100
    @points = 0
  end

  def points_of_cards
    print "Cards of player #{self.name}: "
    @cards.each do |card|
      @point += card.value
      print " #{card.name} "
    end
    puts
  end

    def add_card(card)
      @cards << card
    end

    def change_bank(value)
      @bank += value
    end

end
