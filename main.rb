require 'ruby2d'
require './snake'
require './bait'

snake = Snake.new
bait = Bait.new


on :key_down do |event|
    if event.key == 'w'
      snake.direction = :up
    elsif event.key == 's'
      snake.direction = :down
    elsif event.key == 'a'
      snake.direction = :left
    elsif event.key == 'd'
      snake.direction = :right
    end
end

update do
    clear
     
    snake.draw
    snake.movement
    #if snake.off_bounds
       # snake = Snake.new(1.5)
    #end
    bait.draw
    if bait.ate(snake)
        puts "smelt it"
    end
end

show