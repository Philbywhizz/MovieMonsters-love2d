---
--- Movie Monsters
---

-- Globals
GameState = require 'lib.hump.gamestate'
Inspect = require 'lib.inspect'
Concord = require 'lib.concord'

ECS = {
    c = Concord.components,
    s = {}
}

Concord.utils.loadNamespace('components')
Concord.utils.loadNamespace('systems', ECS.s)

-- switch to the start state
local startState = require("state.movie")
GameState.registerEvents()
GameState.switch(startState)
