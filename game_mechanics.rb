module GameMechanics

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
