require 'pry'
require_relative 'animals'
require_relative 'clients'

$shelter = {
  :animals => [],
  :clients => []
}

###

p1 = Clients.new 'Finn', 0, 13, 2
p2 = Clients.new 'Jeff', 4, 44, 1
p3 = Clients.new 'Betty', 1, 28, 1

a4 = Animals.new 'BMO', 5, 'female', 'robot', 'controller', nil
a1 = Animals.new 'Jake', 28, 'male', 'magic dog', 'sword', nil 
a2 = Animals.new 'Bill', 6, 'male', 'cat', 'laser pointer', nil
a3 = Animals.new 'Milly', 4, 'female', 'mouse', 'gun', nil

$shelter[:animals] << a1 << a2 << a3 << a4
$shelter[:clients] << p1 << p2 << p3


###

def main_menu
  puts '============================================================='
  puts "HappiTails r us: "
  puts '============================================================='
  puts "Select a number accordingly: "
  puts '-------------------------------------------------------------'
  puts "[1] display all of the animals in the shelter"
  puts "[2] display our current clients"
  puts "[3] register your animal"
  puts "[4] register yourself"
  puts "[5] if you are registered and would like to adopt an animal"
  puts "[6] if you would like to put your animal up for adoption"
  puts '-------------------------------------------------------------'

  gets.to_i
end

def register_animal
  puts "Animal registraiton: "

  print "Please enter the animals name: "
  name = gets.chomp

  print "Please enter the age of your animal: "
  age = gets.to_i

  print "Please enter the gender of your animal: "
  gender = gets.chomp

  print "Please enter the species of your animal: "
  species = gets.chomp

  print "Please specify your animals toys: "
  toys = gets.chomp

  print "Please enter your name: "
  owner = gets.chomp

  $shelter[:animals] << Animals.new(name, age, gender, species, toys, owner)
end

def register_client
  puts "Client registration: "

  print "Please enter your name: "
  name = gets.chomp

  print "Please enter the number of children you own: "
  children = gets.to_i

  print "How old are you: "
  age = gets.to_i

  print "How many pets do you own: "
  num_pets = gets.to_i

  $shelter[:clients] << Clients.new(name, children, age, num_pets)
end

def validate_client(name)
  $shelter[:clients].each do |my_client|
    if my_client.name == name
      return my_client
    end
  end
  my_client = nil
  puts 'Invalid client!'
end

def validate_pet(pet)
    $shelter[:animals].each do |my_pet|
    if my_pet.name == pet
      return my_pet
    end
  end
  my_pet = nil
  puts 'Invalid pet!'
end

def adoption_start
  print "Please enter your name: "
  name = gets.chomp
  my_client = validate_client(name)
  return if my_client == nil
  print 'Enter pet to adopt: '
  pet_name = gets.chomp
  my_pet = validate_pet(pet_name)
  return if my_pet == nil
  if my_pet.owner 
    puts "Pet is owned by #{my_pet.owner}"
    return
  end
  my_client.pet_name << my_pet.name 
  my_client.num_pets += 1
  my_pet.owner = my_client.name
  puts "You have adopted #{my_pet.name}."

end

def put_up_adopt
  print "Please enter your name: "
  name = gets.chomp
  my_client = validate_client(name)
  return if my_client == nil
  print "Which pet are you putting up? "
  pet_name = gets.chomp
  my_pet = validate_pet(pet_name)
  return if my_pet == nil
  if my_pet.owner != my_client.name
    puts "Please put your own pet up."
    return 
  end
  my_pet.owner = nil
  my_client.num_pets -= 1
  my_client.pet_name.delete(my_pet.name) 
  puts "Sad to see your pet go."

end


menu_select = main_menu

until menu_select == 7

case menu_select

  when 1
    puts $shelter[:animals]
  when 2
    puts $shelter[:clients]
  when 3
    register_animal
  when 4
    register_client
  when 5
    adoption_start
  when 6
    put_up_adopt

  end
  menu_select = main_menu
end


# CREATE SOME DUMMY PEOPLE
# Then work on the adopt method and figure out how to select a person by their name



# binding.pry
