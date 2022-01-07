---
--- Movie Monsters
---

-- Globals
GameState = require 'lib.hump.gamestate'
Inspect = require 'lib.inspect'
Concord = require 'lib.concord'
Vector = require 'lib.brinevector'

ECS = {
    c = Concord.components,
    s = {}
}

Concord.utils.loadNamespace('components')
Concord.utils.loadNamespace('systems', ECS.s)

-- switch to the start state
local startState = require 'state.splash'
GameState.registerEvents()
GameState.switch(startState)
