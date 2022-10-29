def map_controls(snake)
    on :key_down do |event|
        if event.key == 'w'
            snake.change_direction(:up)
        elsif event.key == 's'
            snake.change_direction(:down)
        elsif event.key == 'a'
            snake.change_direction(:left)
        elsif event.key == 'd'
            snake.change_direction(:right)
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