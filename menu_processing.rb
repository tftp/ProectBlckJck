module MenuProcessing

  def menu_for_player
    puts 'Сделай правильный выбор!'
    puts '1 - Пропустить ход'
    puts '2 - Взять карту'
    puts '3 - Открыть карты'
  end

  def choise_of_dealer
    count_of_cards = @dealer.cards.count
    if @dealer.points < 17 && count_of_cards < 3
      @dealer.add_card(select_card)
      puts "\nИгрок #{@dealer.name} взял карту."
      @player.points_of_cards SHOW
      @dealer.points_of_cards HIDE
    end
  end

  def open_cards
    @player.points_of_cards SHOW
    @dealer.points_of_cards SHOW
    dealer_win if @player.points > 21 && @dealer.points <= 21
    player_win if @dealer.points > 21 && @player.points <= 21
    game_lose if @dealer.points > 21 && @player.points > 21
    if @dealer.points <= 21 && @player.points <= 21
      dealer_win if @dealer.points > @player.points
      player_win if @dealer.points < @player.points
      game_tie if @dealer.points == @player.points
    end
  end
  
  def dealer_win
  
  end
  
  def player_win
  
  end
  
  def game_lose
  
  end
  
  def game_tie
  
  end

end
