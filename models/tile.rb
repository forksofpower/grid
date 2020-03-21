# A tile is a locational pointer that can be converted to string
# Tiles neighbors must be set manually because the size of the
#   parent Grid must be known to determine the edges
#
# TODO: Figure out if this is even necessary? I need the Tile class to apply methods
#       to Players/Riders/Drivers/etc... and track their movement around the grid. I want to
#       store that as just a string in the db. Once I have that string, doing math in between
#       two tiles is just a matter of decoding the string and returning a string for a Tile,
#       and a and array of strings for a Route.
class Tile
    attr_reader :x, :y, :up, :down, :left, :right
    @@all = {}

    def initialize(x=nil, y=nil)
        @x=x
        @y=y
    end

    # Add a Tile to the tiles hash
    def save
        test = self.class.coordinates_to_tile_id(x, y).to_sym
        @@all[test] = self # save Tile to Tiles hash
    end

    def set_direction(direction, height, width)
        case direction
        when 'left'
        # check tile.x - 1 >= 0
        @left = (self.x - 1 >= 0) ? self.class.coordinates_to_tile_id(self.x - 1, self.y) : nil
        when 'right'
        # check tile.x + 1 <= self.width - 1
        @right = (self.x + 1 <= width - 1) ? self.class.coordinates_to_tile_id(self.x + 1, self.y) : nil 
        when 'up'
        # check tile.y + 1 <= self.height - 1 
        @up = (self.y + 1 <= height - 1) ? self.class.coordinates_to_tile_id(self.x, self.y + 1) : nil
        when 'down'
        # check tile.y - 1 >= 0
        @down = (self.y - 1 >= 0) ? self.class.coordinates_to_tile_id(self.x, self.y - 1) : nil
        end
    end

    # return the string id
    def id
        self.class.coordinates_to_tile_id(self.x, self.y)
    end

    # # # # # # # # # # # # # # # # # # # # # # # # # 
    def self.all
        @@all
    end

    def self.create(x, y)
        tile = self.new(x, y)
        tile.save
        tile
    end

    # # # # # # # # # # # # # # # # # # # # # # # # # 
    private
    def self.string_to_coordinates(tile_string)
        tile_string.gsub("tl-", "").split("-")
    end

    def self.coordinates_to_tile_id(x=0, y=0)
        "tl-#{x}-#{y}".to_sym
    end
end