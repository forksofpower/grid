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

  # calculate the distance between two tiles
  def linear_distance(tile_a, tile_b)
    x1, y1 = tile_a.x, tile_a.y
    x2, y2 = tile_b.x, tile_b.y
    Math.sqrt((x2 - x1)**2 + (y2 - y1)**2).abs
  end

  # find a 90 degree path between two tiles
  def find_path(tile_a, tile_b)
    if rand(0..1).floor() === 1
      # start horizontal
      x, y = tile_a.x, tile_b.y
    else
      # start vertical
      x, y = tile_b.x, tile_a.y
    end

    turn_point = tile_by_coordinates(x, y)

    [tile_a, turn_point, tile_b]

    # if (x2 > x1)
    #   delta_x = x2 - x1
    #   delta_y = y2 - y1
    # else
    #   delta_x = x1 - x2
    #   delta_y = y1 - y2
    # end
  end
end