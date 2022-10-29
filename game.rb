require './snake'
require './bait'
require './score'

class Game

    def initialize(snake,bait,score)
        @snake = snake
        @bait = bait
        @score = score
    end
    
    def start
    
        @score.draw
        if @snake.collide?
            @snake = Snake.new
            map_controls(snake)
            @score = Score.new
        end


        @snake.draw
        @snake.off_bounds
        @snake.movement

        @bait.draw
        if @bait.ate?(@snake)
            @snake.grow
            @bait.randomize_position
            @score.ate?
        end
    end
end