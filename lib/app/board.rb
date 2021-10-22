class Board
  attr_accessor :bordcases

  ### INITIALISER UN TABLEAU VIDE A CHAQUE NOUVELLE PARTIE ###
  def initialize
    @A1 = BoardCase.new('A1') 
    @A2 = BoardCase.new('A2')
    @A3 = BoardCase.new('A3')
    @B1 = BoardCase.new('B1')
    @B2 = BoardCase.new('B2')
    @B3 = BoardCase.new('B3')
    @C1 = BoardCase.new('C1')
    @C2 = BoardCase.new('C2')
    @C3 = BoardCase.new('C3')

    @boardcases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
    @boardcases_unfilled = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"] #servia pour déterminer si une case est dispo en fonction des cases déjà sélectionnées
  end

  ### METHODE POUR AFFICHE LE BOARD ###
  def display_board
    puts
    puts "   |_1_|_2_|_3_|"
    puts "_A_| #{@A1.case_value} | #{@A2.case_value} | #{@A3.case_value} |"
    puts "_B_| #{@B1.case_value} | #{@B2.case_value} | #{@B3.case_value} |"
    puts "_C_| #{@C1.case_value} | #{@C2.case_value} | #{@C3.case_value} |"
    puts
  end 

  ### METHODE POUR LE TOUR D'UN JOUEUR ###
  def player_choice(player) # variable 'player' qui sera remplacée par l'instance player1 et player 2

    puts "Quelle action veux-tu effectuer ? ⚔️ "
    puts 
    puts "Exemple : entre 'A1' pour cocher la case A1 ou 'B2' pour cocher la case B2, etc."
    puts
    print "> "
    user_choice = gets.chomp.to_s.upcase
    puts 

    while @boardcases_unfilled.include?(user_choice) == false
      puts "La case sélectionnée n'existe pas ou n'est plus disponible. Essaye encore !"
      print "> "
      user_choice = gets.chomp.to_s.upcase
      puts 
    end

    #Suppression de la case sélectionnée de la liste des cases disponibles
    @boardcases_unfilled.delete(user_choice)

    #Modification de la case sélectionnée par le joueur
    case user_choice
    when "A1"
      @A1.case_value = player.symbol
    when "A2"
      @A2.case_value = player.symbol
    when "A3"
      @A3.case_value = player.symbol
    when "B1"
      @B1.case_value = player.symbol
    when "B2"
      @B2.case_value = player.symbol
    when "B3"
      @B3.case_value = player.symbol
    when "C1"
      @C1.case_value = player.symbol
    when "C2"
      @C2.case_value = player.symbol
    when "C3"
      @C3.case_value = player.symbol
    else 
      puts "Mauvaise entrée...choisis une case libre parmi les options du menu."
      user_choice = gets.chomp #autre solution >>> "next" pour retour au début de la boucle !
    end
  end

  ### METHODES POUR DETERMINER SI UNE PARTIE EST TERMINEE ###

  #Cas n°1 : il n'y a plus de case libre > it's a draw
  def is_full?
    filled_cases_counter = 0
    @boardcases.each do |boardcase|
      if boardcase.case_value == "x" || boardcase.case_value == "o"
        filled_cases_counter += 1
      end
    end
    if filled_cases_counter == 9
      return true
    else
      return false
    end
  end

  #Cas n°2 : il y a un vainqueur
  def is_winner?
    if @A1.case_value + @A2.case_value + @A3.case_value == "xxx" || @A1.case_value + @A2.case_value + @A3.case_value == "ooo" 
      return true
    elsif @B1.case_value + @B2.case_value + @B3.case_value == "xxx" || @B1.case_value + @B2.case_value + @B3.case_value == "ooo"
      return true
    elsif @C1.case_value + @C2.case_value + @C3.case_value == "xxx" || @C1.case_value + @C2.case_value + @C3.case_value == "ooo"
      return true
    elsif @A1.case_value + @B1.case_value + @C1.case_value == "xxx" || @A1.case_value + @B1.case_value + @C1.case_value == "ooo"
      return true
    elsif @A2.case_value + @B2.case_value + @C2.case_value == "xxx" || @A2.case_value + @B2.case_value + @C2.case_value == "ooo"
      return true
    elsif @A3.case_value + @B3.case_value + @C3.case_value == "xxx" || @A3.case_value + @B3.case_value + @C3.case_value == "ooo"
      return true
    elsif @A1.case_value + @B2.case_value + @C3.case_value == "xxx" || @A1.case_value + @B2.case_value + @C3.case_value == "ooo"
      return true
    elsif @A3.case_value + @B2.case_value + @C1.case_value == "xxx" || @A3.case_value + @B2.case_value + @C1.case_value == "ooo"
      return true
    else
      return false
    end
  end
  
  ### METHODE POUR NETTOYER LE BOARD ###
  def clean_board
    @A1.case_value = "-"
    @A2.case_value = "-"
    @A3.case_value = "-"
    @B1.case_value = "-"
    @B2.case_value = "-"
    @B3.case_value = "-"
    @C1.case_value = "-"
    @C2.case_value = "-"
    @C3.case_value = "-"
    @boardcases_unfilled = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end
end