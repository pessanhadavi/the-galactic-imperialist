# The Galactic Imperialist
This is a project that uses connections to APIs ([SWAPI](https://swapi.dev/) and [Akabab-StarWars](https://github.com/akabab/starwars-api)) to populate the database and display Star Wars characters on a clickable list. You can also read details about the characters.

## Getting started
1) If you want to fork/clone the project, make sure you have [PostgreSQL](https://www.postgresql.org/) installed in your machine

2) You'll also need to have Ruby installed in your machine
```
rbenv install 2.6.6
rbenv global 2.6.6
```
3) Install Rails 6.0.3.7
```
gem install rails -v 6.0
```
4) If you don't have bundler installed, you need to install it:
```
gem install bundler
```
5) After that, run bundle on the terminal to install the gems

6) At last, you need to create and migrate the development database
```
rails db:create db:migrate
```
7) Don't forget to seed the database, so it gets populated by the Star Wars information
```
rails db:seed
```
8) You can finally check the web application
```
rails s
http://localhost:3000/
```
