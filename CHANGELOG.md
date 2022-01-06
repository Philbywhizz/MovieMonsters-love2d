# Change Log
All notable changes to MovieMonster will be documented in this file.

The file format is based on [Keep a Change Log](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) specification.

## Unreleased

## v0.0.3
### Added
- Added a simple grid map to the world and display it to the screen. Make everything operate on grid coordinates rather than screen coordinates to decouple the graphics from the logic.
- Added collision detection and confined new entities to the map only.
- Added in checking for valid map locations so we don't reference outside of the map, or out of bounds cells.
### Changed
- Gave drawable components a size parameter, and made the monster larger.
- Adjusting the color for actor entity types.
- Modified the Concord ECS library so you can set and get resources for a world. Borrowed the idea from [here](https://github.com/Tjakka5/Concord/pull/57/files).

## v0.0.2
Basic implementation of Actor entities that move around the screen randomly. They don't do much, but it is cool to watch.
### Added
- Actor entities and a simple ActorAI system that moves entities around the screen randomly
- [brinevector](https://github.com/novemberisms/brinevector) library added to the project
### Changed
- Updated the draw component and draw system to support colors, now the monster is red so you can tell the difference between entities on the screen.

## v0.0.1
Simple implementation of using an ECS library ([Concord](https://github.com/Tjakka5/Concord)) and create a player controlled entity with a few working systems in place. You can now move your monster around an empty screen with the arrow keys.
### Added
- Draw system that renders all drawable entities on the screen
- Player input system to send messages to other systems
- Created just a single entity (the monster) for testing that the player can move around with the arrow keys.
- Simple movement commands consist of FWD/BACK/LEFT/RIGHT
### Removed
- Removed the velocity system and related components as it isn't in use

## v0.0.0
This version will simply setup and test any initial game libraries, testing utilities, github actions, etc. There is no gameplay for this version outside of an empty shell. The main focus is to setup a working ECS framework using [Concord](https://github.com/Tjakka5/Concord).
### Added
- .luacheckrc configuration file for [luacheck](https://github.com/mpeterv/luacheck).
- Github community standards documentation.
- [inspect](https://github.com/kikito/inspect.lua) library added to the project.
- [lovebird](https://github.com/rxi/lovebird) library added to the project.
- [concord](https://github.com/Tjakka5/Concord) ECS library added.
- [hump](https://github.com/vrld/hump) library added to the project.
- [anim8](https://github.com/kikito/anim8)An animation library for LÖVE

