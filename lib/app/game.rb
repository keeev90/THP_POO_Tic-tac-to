class Game
  attr_accessor :players_array, :current_player, :game_status, :board 
  
  #INITITALISATION D'UNE NOUVELLE PARTIE
  def initialize

    ### INTRO ###
    puts "----------------------------------------------------------------------"
    puts "🌟🌟🌟🌟🌟🌟🌟🌟🌟 Bienvenue dans le MORPION 🌟🌟🌟🌟🌟🌟🌟🌟🌟"
    puts "----------------------------------------------------------------------"
    puts "----- Le but du jeu est d'aligner ses 3 symboles avant l'autre -------"
    puts "----------------------------------------------------------------------"
    puts

    ### INITIALISATION DES JOUEURS ###
    puts "Salut !"
    puts
    puts "Quel est le prénom du joueur 1 ?"
    print "> "
    player1_name = gets.chomp 
    @player1 = Player.new(player1_name, "x")
    puts "Bienvenue #{@player1.name}. Ton symbole est le #{@player1.symbol}"
    puts

    puts "Quel est le prénom du joueur 2 ?"
    print "> "
    player2_name = gets.chomp 
    @player2 = Player.new(player2_name, "o")
    puts "Bienvenue #{@player2.name}. Ton symbole est le #{@player2.symbol}"
    puts

    puts " READY ? LET'S PLAY ! "
    sleep 2
    puts

    ### INITIALISATION DES AUTRES VARIABLES ###
    @players_array = [@player1, @player2]
    @current_player = @players_array[rand(0..1)]
    @game_status = "ongoing"

    ### INITIALISATION D'UN BOARD VIDE ###
    @board = Board.new
  end

  ### METHODE POUR RELANCER UNE NOUVELLE PARTIE EN INITIALISANT UN NOUVEAU BOARD ###
  def new_game
    puts "Une autre partie ? Entre YES ou NO ci-dessous."
    print "> "
    user_input = gets.chomp
    puts
    if user_input == "YES"
      Game.new
    else 
      puts "END OF GAME"
    end
  end

  ### MEGA-METHODE POUR LANCER LE JEU VIA LES AUTRES METHODES DE CLASSES ###
  def perform
    @board.display_board

    #while @board.is_winner? == false #on alterne les tours entre les deux joueurs tant qu'il n'y a pas un gagnant
      if @current_player == @player2
        @current_player = @player1
        puts "C'est à ton tour, #{@player1.name} !"
        puts
        @board.player_choice(@player1)
        @board.display_board
        puts ("BRAVO #{@player1.name}, tu gagnes la partie !") if @board.is_winner? == true
        puts ("MATCH NUL. Beau duel, bravo aux deux artistes !") if @board.is_full? == true
      elsif @current_player == @player1
        @current_player = @player2
        puts "C'est à ton tour, #{@player1.name} !"
        puts
        @board.player_choice(@player2)
        @board.display_board
        puts ("BRAVO #{@player2.name}, tu gagnes la partie !") if @board.is_winner? == true
        puts ("MATCH NUL. Beau duel, bravo aux deux artistes !") if @board.is_full? == true
      #else
        #next
      end
    #end
    new_game
    @board.reinit
    system ("clear")
  end
end 