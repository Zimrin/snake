require 'ruby2d'
require './snake'
require './bait'
require './controls'
require './score'
require './menu'
require './game'

@snake = nil
@game = nil

@menu = Menu.new
@scene = :menu

def init_game
    @snake = Snake.new

    bait = Bait.new
    score = Score.new
    @game = Game.new(@snake,bait,score)
    @game.on_collision do
        @scene = :menu
    end

    @scene = :game
end

map_menu_keys do
    init_game()
end

map_controls do |direction|
    @snake.change_direction(direction)
end

update do
    clear
    puts @scene
    if @scene == :menu
        @menu.draw
    else
        @game.draw
    end
end

show