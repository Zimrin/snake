
set background: 'white'
set fps_cap: 20

GRID_SIZE = 20
RADIUS = 10

class Snake

    attr_accessor :direction, :start
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
        if head[1] == 0
            @start.shift
            @start.push([head[0],24])
        elsif head[1] > 24
            @start.shift
            @start.push([head[0],0])
        end

        if head[0] == 0
            @start.shift
            @start.push([32,head[1]])
        elsif head[0] > 32
            @start.shift
            @start.push([0,head[1]])
        end
    end
end


