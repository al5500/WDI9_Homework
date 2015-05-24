class Clients
  attr_accessor :name, :children, :age, :num_pets, :pet_name

  def initialize(name, children, age, num_pets)
    @name = name
    @children = children
    @age = age
    @num_pets = num_pets
    @pet_name = []
  end

  def to_s
    puts "The client is #{@name}, has #{@children} kids, is #{@age} years old and has #{@num_pets} pets.#{@pet_name}"
  end
end
