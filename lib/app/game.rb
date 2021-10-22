class Game
  attr_accessor :players_array, :current_player, :board 
  
  #INITITALISATION D'UNE NOUVELLE PARTIE
  def initialize(player1, player2)

    ### INITIALISATION D'UN BOARD VIDE ###
    @board = Board.new

    ### INITIALISATION DES JOUEURS ###
    @players_array = []
    @current_player = Player.new(player1, "x")
    @players_array << @current_player
    @current_player = Player.new(player2, "o")
    @players_array << @current_player
  end

  ### UNE PARTIE = BOUCLE DE ROUNDS ###
  def rounds
    loop do
      system('clear')
      
      @board.display_board

      #tour du joueur 1
      puts "C'est au tour de : #{players_array[0].name}"
      @board.player_choice(players_array[0])
      @board.display_board

      if @board.is_winner? == true
        puts "BRAVO #{players_array[0].name}, tu gagnes la partie !" 
        break
      elsif @board.is_full? == true
        puts "MATCH NUL. Beau duel, bravo aux deux artistes !"
        break
      end

      #tour du joueur 2
      puts "C'est au tour de : #{@players_array[1].name}"
      puts
      @board.player_choice(players_array[1])
      @board.display_board

      if @board.is_winner? == true
        puts "BRAVO #{@players_array[1].name}, tu gagnes la partie !"  
        break
      elsif @board.is_full? == true
        puts "MATCH NUL. Beau duel, bravo aux deux artistes !"
        break
      end 
    end
  end

  ### METHODE POUR REINITIALISER LE BOARD ###
  def new_board
   board.clean_board
  end
end