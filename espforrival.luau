-- Access the Players service correctly
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local function applyHighlightToCharacter(player, character)
    -- Check if the player is the local player and return early if it is
    if player == localPlayer then
        return
    end

    -- Ensure the character exists before applying the highlight
    if character then
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
        highlight.FillTransparency = 1
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        applyHighlightToCharacter(player, character)
    end)
    -- Check if player already has a character
    if player.Character then
        applyHighlightToCharacter(player, player.Character)
    end
end

-- Apply to existing players
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Apply to new players
Players.PlayerAdded:Connect(onPlayerAdded)
