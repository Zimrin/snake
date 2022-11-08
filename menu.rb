require './game'

class Menu
 
    def draw
      Text.new(
        "Press Space to Start",
        x: 320, y: 240,
        style: 'bold',
        size: 20,
        color: 'red',
        z: 11
      )
    end

    def play_game(game)
      game.start
    end

end