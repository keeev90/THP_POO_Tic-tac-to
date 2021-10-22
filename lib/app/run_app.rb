class RunApp

  ### INTRO ###
  def start_game
    puts "----------------------------------------------------------------------"
    puts "🌟🌟🌟🌟🌟🌟🌟🌟🌟 Bienvenue dans le MORPION 🌟🌟🌟🌟🌟🌟🌟🌟🌟"
    puts "----------------------------------------------------------------------"
    puts "----- Le but du jeu est d'aligner ses 3 symboles avant l'autre -------"
    puts "----------------------------------------------------------------------"
    puts

    puts " READY ? LET'S PLAY ! "
    sleep 1
    puts
  end

  ### INITIALISATION DES JOUEURS ###
  def ask_player1_name
    puts "Salut !"
    puts
    puts "Quel est le prénom du joueur 1 ?"
    print "> "
    player1_name = gets.chomp 
    puts "Bienvenue #{player1_name}. Ton symbole est le 'x'"
    puts
    return player1_name
  end

  def ask_player2_name
    puts "Quel est le prénom du joueur 2 ?"
    print "> "
    player2_name = gets.chomp 
    puts "Bienvenue #{player2_name}. Ton symbole est le 'o''"
    puts
    return player2_name
  end

  ### METHODE POUR RELANCER UNE NOUVELLE PARTIE EN INITIALISANT UN NOUVEAU BOARD ###
  def new_game?(game)
    puts "Une autre partie ? Entre YES ou NO ci-dessous."
    print "> "
    user_input = gets.chomp
    puts
    if user_input == "YES" || "yes"
      system ("clear")
      game.new_board
      game.rounds
    else 
      system ("clear")
      puts "END OF GAME"
    end
  end

  ### MEGA-METHODE LANCER ET DEROULER LE JEU VIA LES AUTRES METHODES DE CLASSES ###
  def perform
    start_game

    player1 = ask_player1_name
    player2 = ask_player2_name

    game = Game.new(player1, player2)
    game.rounds

    new_game?(game)
  end
end