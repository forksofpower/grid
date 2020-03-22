require_relative '../config/environment.rb'


### IGRNORE ALL THIS FOR NOW
# Route has_many Tiles (sorta)
# Tile has_many routes

# Ride has a Route
# Ride has_many passengers
# Ride has a Driver
# Ride has an eta? (based on cycles???)

# Passenger has_many co_passengers through Ride?
# Passenger has a driver through ride
# Passenger has a Route through Ride


# grid = nil
# report = MemoryProfiler.report do
puts "Generating Grid @ " + DateTime.now.to_s
grid = Grid.new(height: 100, width: 100)

tile_a = grid.tile("tl-89-99")
tile_b = grid.tile("tl-45-66")

distance = grid.linear_distance(tile_a, tile_b)

# p "Finding Tile: tl-88-89 @ " + Grid.find_tile_by_id("tl-88-89").u
# puts grid.tiles
# end
# report.pretty_print




# 
# example: grid.find_tile_by_id("tl-88-89")
#
#
binding.pry
0