require 'ruby2d'
require './snake'
require './bait'
require './controls'

snake = Snake.new
bait = Bait.new

map_controls(snake)

update do
    clear

    
    if snake.collide?
        snake = Snake.new
        map_controls(snake)
    end


    snake.draw
    snake.off_bounds
    snake.movement

    bait.draw
    if bait.ate?(snake)
        puts "smelt it"
        snake.grow
        bait.randomize_position
    end
    

end

show