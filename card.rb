class Card

  attr_reader :name, :value
  attr_accessor :busy

  def initialize (name, value)
    @name = name
    @value = value
    @busy = false
  end

end
