class Bait

    GRID_SIZE = 20
    RADIUS = 10
    def initialize
        @bait = [7,3]
    end

    def draw
        Circle.new(x: @bait[0] * GRID_SIZE, y: @bait[1] * GRID_SIZE,radius: RADIUS-5,sectors: 32,color: 'brown')
    end

    def ate?(snake)
        snake.head == @bait
    end

    def randomize_position
        @bait = [rand(1..31),rand(1..23)]
    end
end