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
scene = :menu

map_menu_keys do
    scene = :game
end

update do
    clear
    if scene == :menu
        menu.draw
    else
        game.start
    end
end

show