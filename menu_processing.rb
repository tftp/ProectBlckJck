module MenuProcessing

  def menu_for_player
    puts "\nСделай правильный выбор!"
    puts '1 - Пропустить ход'
    puts '2 - Взять карту'
    puts '3 - Открыть карты'
  end

  def repeat_game?
    puts "\nЖелаешь сыграть ещё, странник?"
    puts '1 - Да'
    puts '2 - Нет'
    '1' == gets.chomp ? true : false
  end

  def choise_of_dealer
    count_of_cards = @dealer.cards.count
    if @dealer.points < 17 && count_of_cards < 3
      @dealer.add_card(select_card)
      puts "\nИгрок #{@dealer.name} взял карту."
      sleep 1
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
  puts "\nПобедил #{@dealer.name}"
  sleep 1
  puts "\nБанк игрока #{@player.name} = #{@player.bank}"
  puts "Банк игрока #{@dealer.name} = #{@dealer.bank += @bank}"
  @bank = 0
  sleep 1
  end

  def player_win
    puts "\nПобедил #{@player.name}"
    sleep 1
    puts "\nБанк игрока #{@player.name} = #{@player.bank += @bank}"
    puts "Банк игрока #{@dealer.name} = #{@dealer.bank}"
    @bank = 0
    sleep 1
  end

  def game_lose
    puts "\nОба игрока проиграли!"
    sleep 1
    puts "\nБанк игрока #{@player.name} = #{@player.bank}"
    puts "Банк игрока #{@dealer.name} = #{@dealer.bank}"
    @bank = 0
    sleep 1
  end

  def game_tie
    puts "\nНичья!"
    sleep 1
    puts "\nБанк игрока #{@player.name} = #{@player.bank += @bank / 2}"
    puts "Банк игрока #{@dealer.name} = #{@dealer.bank += @bank / 2}"
    @bank = 0
    sleep 1
  end

  def processing(sign)
    print sign
    40.times do
      print '.'
      sleep 0.1
    end
    puts
    puts
  end

end
