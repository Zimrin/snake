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

=begin
map_menu_keys do
    scene = :game
end
=end

update do
    clear
    map_menu_keys do
        scene = :game
    end
    if scene == :menu or snake.collide?
        menu.draw
    else
        game.start
    end
end

show