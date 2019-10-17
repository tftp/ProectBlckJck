module GameMechanics

  def points_of_cards(show)
    print "\nКарты игрока #{self.name}: "
    @cards.each {|card| print " #{show ? card.name : '*'}  "}
    print "Очков: #{show ? self.points : '*' }  "
    puts "Банк = #{self.bank}"
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
