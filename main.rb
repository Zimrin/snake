require 'ruby2d'
require './snake'
require './bait'
require './controls'
require './score'

snake = Snake.new
bait = Bait.new
score = Score.new

map_controls(snake)

update do
    clear

    score.draw
    if snake.collide?
        snake = Snake.new
        map_controls(snake)
        score = Score.new
    end


    snake.draw
    snake.off_bounds
    snake.movement

    bait.draw
    if bait.ate?(snake)
        snake.grow
        bait.randomize_position
        score.ate?
    end
    

end

show