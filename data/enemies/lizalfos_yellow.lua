local enemy = ...
local behavior = require("enemies/generic/toward_hero")

-- Lizalfos.

local properties = {
  main_sprite = "enemies/lizalfos_yellow",
  life = 10,
  damage = 8,
  normal_speed = 48,
  faster_speed = 72,
}

behavior:create(enemy, properties)

function enemy:on_attacking_hero(hero)
  if not hero:is_invincible() then
    hero:start_electrocution(1500)
    hero:set_invincible(true, 200)
    if self:get_game():get_magic() > 0 then
      self:get_game():remove_magic(2)
      sol.audio.play_sound("magic_bar")
    end
  end
end