class Card

  attr_reader :name, :value

  def initialize (name, value)
    @name = name
    @value = value
    @busy = false
  end

end
