# frozen_string_literal: true

class Diller
  include GameMechanics
  attr_accessor :bank, :cards, :points, :ace
  attr_reader :name

  def initialize
    @name = 'Computer'
    @cards = []
    @bank = 100
    @points = 0
    @ace = 0
  end
end
