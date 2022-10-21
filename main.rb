require 'ruby2d'
require './snake'
require './bait'
require './controls'

snake = Snake.new
bait = Bait.new

map_controls(snake)

update do
    clear
     
    snake.draw
    snake.off_bounds
    snake.movement
    #if snake.off_bounds
       # snake = Snake.new(1.5)
    #end
    
    bait.draw
    if bait.ate(snake)
        puts "smelt it"
        snake.grow
    end
end

show