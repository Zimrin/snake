require 'ruby2d'

set background: 'white'

class Snake

    RADIUS = 100

    attr_accessor :direction, :shape, :x, :y
    def initialize(speed,direction = :right)
        @x = 50
        @y = 50
        @speed = speed
        @direction = direction
    end
    
    def draw(a = @x, b = @y)
        @shape = Circle.new(x: @x, y: @y,radius: RADIUS,sectors: 32,color: 'red',z: 11)
    end

    def movement
        if @direction == :up
            @y -= @speed
        elsif @direction == :down
            @y += @speed
        elsif @direction == :left
            @x -= @speed
        elsif @direction == :right
            @x += @speed
        end
    end

    def increment
        draw(10,100)
    end

    def off_bounds
        @x <= 0 || @shape.x >= Window.width || @y <= 0 || (@y+RADIUS) >= Window.height
    end
end

class Bait

    def draw
        Circle.new(x: 300, y: 100,radius: 3,sectors: 32,color: 'black',z: 10)
    end
end

snake = Snake.new(1.5)
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
    if snake.off_bounds
        snake = Snake.new(1.5)
    end
    snake.increment
    bait.draw
end

show