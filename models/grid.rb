require 'date'
# Grid can't do much

class Grid
  attr_reader :height, :width

  def initialize(width:, height:)
    @height = height
    @width = width
    
    generate_tiles
  end

  def generate_tiles
    # loop through height
    @height.times do |position_x|
      #loop through width
      @width.times do |position_y|
        # create a tile
        tile = Tile.create(position_x, position_y)
        # relate each tile to the tile.id of the tiles around it
        %w{up right down left}.each do |direction|
          tile.set_direction(direction, self.height, self.width)
        end
      end
    end
  end

  def find_tile_by_id(id)
    Tile.all[id.to_sym]
  end

  def tiles
    Tile.all
  end
end




