require_relative 'tile'

class Obstacle < Tile
    attr_reader :x, :y
    @@all = {}

    def initialize(type, x, y)
        @type = type
        @x = x
        @y = y
    end

    def save
        @@all[Obstacle.coordinates_to_tile_id(self.x, self.y)] = self
    end

    def tile
        self.id
    end

    def self.all
        @@all
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