require 'ruby2d'
require './snake'
require './bait'
require './controls'
require './score'
require './menu'
require './game'

snake = Snake.new
bait = Bait.new
score = Score.new
game = Game.new(snake,bait,score)
menu = Menu.new


map_controls(snake)
start_game(menu)

update do
    clear

    if menu.get_scene == 1
        game.start
    elsif menu.get_scene == 0
        menu.draw
    end

    
    

end

show