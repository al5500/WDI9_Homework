# Title: MTA Lab
# Activity:

# Students should create a program that models a simple subway system.

# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

# There are 3 subway lines:
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# All 3 subway lines intersect at Union Square, but there are no other intersection points.
# For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.
# Hints:

# Don't worry about user input initially: get it working with hardcoded values first, and wire up the user interface once that's working
# Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
# Make subway lines keys in a hash, while the values are an array of all the stops on each line.
# The key to the lab is to find the intersection of the lines at Union Square.
# Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)
require'pry'
$subway_lines = {
  'N' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  'L' => ['8th', '6th', 'Union Square', '3rd', '1st'],
  '6' => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}
$common_station = 'Union Square'


def trip_planner(depart_line, depart_stop, arrive_line, arrive_stop)
  if depart_line == arrive_line 
    all_stations = line_planner(depart_line, depart_stop, arrive_stop)
    puts "You are leaving #{depart_stop} and are going through #{all_stations} and arriving at #{arrive_stop}."
    puts "Your total number of stops is: #{all_stations.length + 1}"
  else
  
  all_stations = line_planner(depart_line, depart_stop, $common_station)
  total_stops = all_stations.length + 1
  puts "You are leaving #{depart_stop} going through #{all_stations}. Change at #{$common_station} to the #{arrive_line}. "
  all_stations = line_planner(arrive_line, $common_station, arrive_stop)
  total_stops += all_stations.length + 1 
  puts ("Your journey continues thorugh the following stops: #{all_stations} and arriving at #{arrive_stop}.")
  puts "Your total number of stops is: #{total_stops}."
  end
end

def line_planner(depart_line, depart_stop, arrive_stop)
  line_array = $subway_lines[depart_line]
  ds_index = line_array.index(depart_stop)
  as_index = line_array.index(arrive_stop)

  if ds_index < as_index
   stations = line_array[ds_index + 1..as_index - 1]
 else
   stations = line_array[as_index + 1..ds_index - 1]
   stations.reverse!
 end

end

def valid_line(line)
  if $subway_lines[line]
   true
  else 
    false
  end
end 

def input_line(input_prompt)
  my_valid_line = false
  until my_valid_line == true
    print input_prompt
    my_line = gets.chomp.to_s.upcase
    my_valid_line = valid_line(my_line)
    puts "Invalid line #{my_line}" if !my_valid_line
  end
  my_line
end

def valid_station(line, station)
  line_array = $subway_lines[line]
  if line_array.index(station) == nil
    false
  else
    true
  end
end

def input_station(line, input_prompt)
  my_valid_station = false
  until my_valid_station == true
    print input_prompt
    my_station = gets.chomp.to_s
    my_valid_station = valid_station(line, my_station)
    puts "Invalid station #{my_station}" if !my_valid_station

  end
  my_station
end




depart_line = input_line("Departing line: ")

depart_stop = input_station(depart_line, "Departing station: ")

arrive_line = input_line("Arriving line: ")

arrive_stop = input_station(arrive_line, "Arriving station: ")

trip_planner(depart_line, depart_stop, arrive_line, arrive_stop)

puts

# binding.pry






















