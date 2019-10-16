module GameMechanics

  def points_of_cards
    print "Карты игрока #{self.name}: "
    @cards.each do |card|
      @points += card.value
      print " #{card.name} "
    end
    puts "Очков: #{self.points}"
  end

  def add_card(card)
    card.busy = true
    @cards << card
  end

  def change_bank(value)
    @bank += value
  end

end
