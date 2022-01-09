# Project Scope

To keep things into perspective and remain focused, this scope document will define each version of MovieMonster.

## Version 0.0.4 - GameState infrastructure

Setup of game states such as main menus, splash screens, pausing, etc. Many of the menus are placeholders for now and can be fleshed out later on.

## Version 0.0.3 - Grid based movement

Implementation of a grid based map for entity movement. The grid is not a fixed size and the cell size has not been determined yet so the code should have the ability to change these parameters for easy testing. Game entities moving around need to be restricted to the grid.

## Version 0.0.2 - Actor

Create a simple actor that moves around the screen on its own (randomly). An actor has the same move functions as the monster (fwd/back/left/right). There is no spacial awareness yet (its all random)

## Version 0.0.1 - An empty shell testing ECS

I want to use an ECS framework rather than OOP, so to keep things simple this version will have the following conditions before being released:

### Limitations

- A single defined monster (player), with basic movement (fwd, back, turn left, turn right).
- No actors.
- No props.
- No vehicles.
- No aircraft.
- No default game theme, end condition or score keeping.
- An empty city map for testing movement and bounds only.
- Simple shapes for graphics.

### Gameplay scenario conditions and setup

- A single stage that fills up the whole screen.
- A single monster positioned at the center of the world controlled by the player.

## Version 0.0.0 - framework testing and setup

This version will simply setup and test any initial game libraries, testing utilities, github actions, etc. There is no gameplay for this version outside of an empty shell.
