class Menu

    def initialize
      file = File.open("highscore.txt")
      @file_data = file.read
      file.close
    end
 
    def draw
      Text.new(
        "Press Space to Start",
        x: 320, y: 240,
        style: 'bold',
        size: 20,
        color: 'red',
        z: 11
      )
      Text.new(
        "Highscore : ",
        x: 320, y: 290,
        style: 'bold',
        size: 20,
        color: 'red',
        z: 11
      )
      Text.new(
        "#{@file_data}",
        x: 430, y: 290,
        style: 'bold',
        size: 20,
        color: 'blue',
        z: 11
      )
    end

    def play_game(game)
      game.start
    end

end