module MenuProcessing

  def menu_for_player
    puts 'Сделай правильный выбор!'
    puts '1 - Пропустить ход'
    puts '2 - Взять карту'
    puts '3 - Открыть карты'
  end

  def choise_of_dealer
    count_of_cards = @dealer.cards.count
    @dealer.add_card if @dealer.points < 17 && count_of_cards < 3
  end

end
