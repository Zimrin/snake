class Score

    attr_accessor :score
    def initialize()
      @score = 0
    end
  
    def ate?
      @score += 1
    end
    
    def draw
      Text.new(
        "Score #{@score}",
        x: 75, y: 25,
        style: 'bold',
        size: 20,
        color: 'blue',
        z: 11
      )
    end
end