# MonsterBoardGame backend API

This is the backend for the Pokemon Wargame, found [here](https://github.com/astrosquid/monster-board-game-react-frontend).

Data is taken from the [PokeAPI](https://pokeapi.co) and used to create monsters in the database. 

We also store movesets and elemental types. 

Setup is as easy as:

- cloning this repo
- `rails db:create db:migrate db:seed`
  - wait awhile for the seeding to finish
- run on port 4000 with `rails s -p 4000`

Ruby version 2.3.3 is required for this project, but in the future, as we move to Heroku, it will require 2.5.3.

Please see the front end repo linked above for more details!

