require 'ruby2d'

set background: 'white'
set fps_cap: 20

GRID_SIZE = 20
RADIUS = 10

class Snake

    attr_accessor :direction
    def initialize(direction = :right)
        @start = [[2,2], [3,2], [4,2], [5,2]]
        @direction = direction
    end
    
    def draw
        @start.each do |position|
            Circle.new(x: position[0] * GRID_SIZE, y: position[1] * GRID_SIZE,radius: RADIUS,sectors: 50,color: 'red',z: 11)
        end
    end

    def movement
        @start.shift
        if @direction == :up
            @start.push([head[0], head[1] - 1])
        elsif @direction == :down
            @start.push([head[0], head[1] + 1])
        elsif @direction == :right
            @start.push([head[0] + 1, head[1]])
        else @direction == :left
            @start.push([head[0] - 1, head[1]])
        end     
    end

    def head
        @start[-1]
    end

    def off_bounds
       # @x <= 0 || @shape.x >= Window.width || @y <= 0 || (@y+RADIUS) >= Window.height
    end
end

class Bait

    def initialize
        @bait = [7,3]
    end

    def draw
        Circle.new(x: @bait[0] * GRID_SIZE, y: @bait[1] * GRID_SIZE,radius: RADIUS-5,sectors: 32,color: 'brown',z: 10)
    end

    def ate(snake)
        snake.head == @bait
    end
end

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