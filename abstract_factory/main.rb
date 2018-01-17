class Duck
  def initialize name
    @name = name
  end

  def eat
    puts "Duck #{@name} is in the middle of meals."
  end
end

class Frog
  def initialize name
    @name = name
  end

  def eat
    puts "Frog #{@name} is in the middle of meals."
  end
end

class Algae
  def initialize name
    @name = name
  end

  def grow
    puts "Algae #{@name} is growing."
  end
end

class WaterLily
  def initialize name
    @name = name
  end

  def grow
    puts "WaterLily #{@name} is growing."
  end
end

# AbstractFactory
class OrganismFactory
  attr_reader :animals, :plants

  def initialize number_animals, number_plants
    @animals = Array.new
    number_animals.times do |i|
      animal = new_animal "animal #{i}"
      @animals << animal
    end

    @plants = Array.new
    number_plants.times do |i|
      plant = new_plant "plant #{i}"
      @plants << plant
    end
  end
end

# Concrete Factory1
# 組み合わせたいオブジェクトを定義
class FrogAlgaeConcreteFactory < OrganismFactory
  private

  def new_animal name
    Frog.new name
  end

  def new_plant name
    Algae.new name
  end
end

# Concrete Factory2
class DuckWaterLilyConcreteFactory < OrganismFactory
  private

  def new_animal name
    Duck.new name
  end

  def new_plant name
    WaterLily.new name
  end
end

concrete_factory1 = FrogAlgaeConcreteFactory.new 4,1
animals = concrete_factory1.animals
animals.each { |animal| animal.eat }

plants = concrete_factory1.plants
plants.each { |plant| plant.grow }