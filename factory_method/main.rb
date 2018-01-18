# Product1
class Sax
  def initialize name
    @name = name
  end

  def play
    puts "サックス#{@name}は音を奏でています。"
  end
end

# Product2
class Trumpet
  def initialize name
    @name = name
  end

  def play
    puts "トランペット#{@name}は音を奏でています。"
  end
end

# Creator
class InstrumentFactory
  def initialize number_instruments
    @instruments = Array.new
    number_instruments.times do |i|
      @instruments << new_instrument("楽器#{i}")
    end
  end

  def ship_out
    @tmp = @instruments.dup
    @instruments = Array.new
    @tmp
  end
end

# ConcreteCreator for Sax
class SaxFactory < InstrumentFactory
  def new_instrument name
    Sax.new name
  end
end

# ConcreteCreator for Trumpet
class TrumpetFactory < InstrumentFactory
  def new_instrument name
    Trumpet.new name
  end
end

concrete_creator1 = SaxFactory.new 4
saxes = concrete_creator1.ship_out
saxes.each { |sax| sax.play }

concrete_creator2 = TrumpetFactory.new 4
trumpets = concrete_creator2.ship_out
trumpets.each { |trumpet| trumpet.play }