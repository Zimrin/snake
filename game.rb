require './snake'
require './bait'
require './score'
require './controls'

class Game
    attr_accessor :collision_callback

    def initialize(snake,bait,score)
        @snake = snake
        @bait = bait
        @score = score
    end

    def on_collision(&block)
        @collision_callback = block
    end
    
    def draw
        @score.draw

        @snake.draw
        @snake.off_bounds
        @snake.movement

        if @snake.collide?
            collision_callback.call
            return
        end

        @bait.draw
        if @bait.ate?(@snake)
            @snake.grow
            @bait.randomize_position
            @score.ate?
        end
    end
end