#Appeler toutes les gem de mon fichier Gemfile sans avoir à les require en haut de chaque classe (attention à bien compléter le Gemfile et faire un bundle install avant d'executer un programme)
require 'bundler' 
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/player'
require 'app/board'
require 'app/board_case'
#require 'views/done'
#require 'views/index'

#Initialisation d'une nouvelle partie
Game.new.perform