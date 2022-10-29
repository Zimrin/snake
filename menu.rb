class Menu

    def initialize()
        @scene = 0
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
    end

    def change_scene
        @scene = 1
    end

    def get_scene
        @scene
    end
end