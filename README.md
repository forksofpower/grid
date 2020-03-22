![The grid](https://pixabay.com/get/57e5d14b4854ac14f1dc8460825668204022dfe05b55794b772879d7/retro-1548260_640.png)
# Grid

### Why?
Possibly for representing game boards, or for generalizing location, or for fun, or none of those things at all.

### Getting Started

```ruby
# generate new grid
grid = Grid.new(height: 100, width: 100)

# provide a tile id
id = "tl-45-65"
grid.tile(id)
# => #<Tile... @down=:"tl-45-66", @left=:"tl-44-67", @right=:"tl-46-67", @up=:"tl-45-68", @x=45, @y=67>

tile_a = grid.tile("tl-45-66")
tile_b = grid.tile("tl-89-99")

# find distance between two tiles
distance = grid.distance(tile_a, tile_b)
# => 55.0

# find a 3 point path between two tiles
path = grid.find_path(tile_a, tile_b)
# => [<Tile ...>, <Tile ...>, <Tile ...>]
```


### Todo
1. Finalize relationships
2. Convert Tile directional values to instance methods on Grid. Need to be able to return the actual Tile method without linking each one at the start.
3. Trim and polish the hellscape.

### Contributors
1. Fork and clone this repo
2. Switch to the develop branch and then create a new `feature` branch.
3. Make your changes, then submit a pull request.

