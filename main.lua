-- Initialize player position (starting in the middle)
local player = {
    x = 2, -- grid position (1-3)
    y = 2  -- grid position (1-3)
}

-- Grid cell size and offset
local GRID_SIZE_X = 12
local GRID_SIZE_Y = 12
local CELL_SIZE = 40
local GRID_OFFSET_X = 50
local GRID_OFFSET_Y = 50
local canMove = true

function love.load()
    -- Set background color to dark gray
    love.graphics.setBackgroundColor(0.2, 0.2, 0.2)
end

function love.keypressed(key)
    if canMove then
        if key == 'up' then
            player.y = math.max(1, player.y - 1)
        elseif key == 'down' then
            player.y = math.min(GRID_SIZE_Y, player.y + 1)
        elseif key == 'left' then
            player.x = math.max(1, player.x - 1)
        elseif key == 'right' then
            player.x = math.min(GRID_SIZE_X, player.x + 1)
        end
    end
end

function love.draw()
    -- Draw the 3x3 grid
    for row = 1, GRID_SIZE_X do
        for col = 1, GRID_SIZE_Y do
            love.graphics.setColor(0.3, 0.3, 0.3)
            love.graphics.rectangle(
                    'line',
                    GRID_OFFSET_X + (col-1) * CELL_SIZE,
                    GRID_OFFSET_Y + (row-1) * CELL_SIZE,
                    CELL_SIZE,
                    CELL_SIZE
            )
        end
    end

    -- Draw the player (white square)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle(
            'fill',
            GRID_OFFSET_X + (player.x-1) * CELL_SIZE + 5,
            GRID_OFFSET_Y + (player.y-1) * CELL_SIZE + 5,
            CELL_SIZE - 10,
            CELL_SIZE - 10
    )
end