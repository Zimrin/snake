require './bait.rb'


set background: 'white'
set fps_cap: 20

GRID_SIZE = 20
RADIUS = 10

class Snake

    attr_accessor :direction, :body
    def initialize(direction = :right)
        @body = [[2,2], [3,2], [4,2], [5,2]]
        @direction = direction
    end
    
    def draw
        @body.each do |position|
            Circle.new(x: position[0] * GRID_SIZE, y: position[1] * GRID_SIZE,radius: RADIUS,sectors: 50,color: 'red',z: 11)
        end
    end

    def grow
        if @direction == :up
            @body.push([head[0], head[1] - 1])
        elsif @direction == :down
            @body.push([head[0], head[1] + 1])
        elsif @direction == :right
            @body.push([head[0] + 1, head[1]])
        else @direction == :left
            @body.push([head[0] - 1, head[1]])
        end
    end

    def movement
        @body.shift
        grow
    end

    def head
        @body[-1]
    end

    def off_bounds
        if head[1] == 0
            @body.shift
            @body.push([head[0],24])
        elsif head[1] > 24
            @body.shift
            @body.push([head[0],0])
        end

        if head[0] == 0
            @body.shift
            @body.push([32,head[1]])
        elsif head[0] > 32
            @body.shift
            @body.push([0,head[1]])
        end
    end
end


