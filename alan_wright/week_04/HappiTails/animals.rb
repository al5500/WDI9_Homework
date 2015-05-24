class Animals
  attr_accessor :name, :age, :gender, :species, :toys, :owner

  def initialize(name, age, gender, species, toys, owner)
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = toys
    @owner = owner
    
  end
end

def to_s
  puts "The animal is #{@name}, is #{@age} years old, is #{@gender}, is a #{@species} and is owned by #{@owner}."
end
