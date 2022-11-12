require './snake'
require './game'

def map_controls(&on_key_press)
    on :key_down do |event|
        if event.key == 'w'
            on_key_press.call(:up)
        elsif event.key == 's'
            on_key_press.call(:down)
        elsif event.key == 'a'
            on_key_press.call(:left)
        elsif event.key == 'd'
            on_key_press.call(:right)
        end
    end
end


def map_menu_keys(&on_space_press)
    on :key_down do |event|
        if event.key == 'space'
            on_space_press.call
        end
    end
end