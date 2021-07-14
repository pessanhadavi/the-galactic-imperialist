# The Galactic Imperialist
This is a project that uses connections to APIs ([SWAPI](https://swapi.dev/) and [Akabab-StarWars](https://github.com/akabab/starwars-api)) to populate the database and display Star Wars characters on a clickable list. You can also read details about the characters.

## Getting started
1) If you want to fork/clone the project, make sure you have [PostgreSQL](https://www.postgresql.org/) installed in your machine

2) Use rbenv to install the right Ruby version. You can find info about rbenv [here](https://github.com/rbenv/rbenv)

3) You'll also need to have Ruby installed in your machine and running the 2.6.6 version by default
```
rbenv install 2.6.6
rbenv global 2.6.6
```
4) Install Rails 6.0.3.7
```
gem install rails -v 6.0
```
5) If you don't have bundler installed, you need to install it:
```
gem install bundler
npm install --global yarn
```
6) After that, run bundle to install the gems

7) At last, you need to create and migrate the development database
```
rails db:create db:migrate
```
8) Don't forget to seed the database, so it gets populated by the Star Wars information
```
rails db:seed
```
9) You can finally check the web application
```
rails s
http://localhost:3000/
```
