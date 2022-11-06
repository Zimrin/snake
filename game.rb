require './snake'
require './bait'
require './score'
require './controls'

class Game

    def initialize(snake,bait,score)
        @snake = snake
        @bait = bait
        @score = score
    end
    
    def start
    
        @score.draw

        @snake.draw
        @snake.off_bounds
        @snake.movement

        if @snake.collide?
            return :menu
            #menu.draw
           # regen = Snake.new
            #@snake = regen
            #map_controls(@snake)
            #@score = Score.new
        end

        @bait.draw
        if @bait.ate?(@snake)
            @snake.grow
            @bait.randomize_position
            @score.ate?
        end
    end
end