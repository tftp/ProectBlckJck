module GameMechanics

  def points_of_cards(show)
    print "Карты игрока #{self.name}: "
    @cards.each {|card| print " #{show ? card.name : '*'} "}
    puts "Очков: #{show ? self.points : '*'}"
  end

  def add_card(card)
    card.busy = true
    @cards << card
    @points += card.value
  end

  def change_bank(value)
    @bank += value
  end

end
