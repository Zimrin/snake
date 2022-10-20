def map_controls(snake)

    on :key_down do |event|
        if event.key == 'w'
            snake.direction = :up
        elsif event.key == 's'
            snake.direction = :down
        elsif event.key == 'a'
            snake.direction = :left
        elsif event.key == 'd'
            snake.direction = :right
        end
    end
end