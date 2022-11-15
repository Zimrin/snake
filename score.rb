class Score

    attr_accessor :score
    def initialize()
      @score = 0
      file = File.open("highscore.txt")
      @file_data = file.read
      file.close
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
      Text.new(
        "Highscore : ",
        x: 75, y: 45,
        style: 'bold',
        size: 20,
        color: 'red',
        z: 11
      )
      Text.new(
        "#{@file_data}",
        x: 190, y: 45,
        style: 'bold',
        size: 20,
        color: 'blue',
        z: 11
      )
    end
end