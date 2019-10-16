class Diller

  include GameMechanics

# есть банк диллера
# первая раздача по 2 карты
# автоматическая ставка в банк игры
# сумму своих очков ?
# диллер может: пропустить ход если сумма очков 17 и более
# диллер может: добавить карту если сумма очков меньше 17
# может быть добавлена только одна карта
  attr_accessor :bank, :cards, :points
  attr_reader :name

  def initialize
    @name = 'Computer'
    @cards = []
    @bank = 100
    @points = 0
  end

end
