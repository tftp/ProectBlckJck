module GameMechanics

  def points_of_cards(show)
    check_of_ace
    print "\nКарты игрока #{self.name}: "
    @cards.each {|card| print " #{show ? card.name : '*'}  "}
    print "Очков: #{show ? self.points : '*' }  "
    puts "Банк = #{self.bank}"
  end

  def add_card(card)
    card.busy = true
    @cards << card
    @points += card.value
    @ace += 1 if card.name.include?("T")
  end

  def change_bank(value)
    @bank += value
  end

  def check_of_ace
    self.ace.times do
      if self.points > 21
        self.points -= 10
        self.ace -= 1
      end
    end
  end

  def check
    self.cards = []
    self.points = 0
    self.ace = 0
  end

end
