require 'tty-prompt'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------\n
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !        |\n
|Survis et deviens l'homme le plus classe du monde|\n
-------------------------------------------------"

###ON LANCE LE GAME ET ON INSTANCIE LE HUMANPLAYER
puts "Donnez un nom à votre personnage"
print ">"
user_name = gets.chomp
human_player = HumanPlayer.new(user_name)
player1 = Player.new("José")
player2 = Player.new("George Abitbol")
ennemies_array = [player1, player2]

### BOUCLE WHILE
round = 0
### CHECK IF PLAYER IS GAME OVER OR NOT
while human_player.life_points > 0

  puts "------ ROUND #{round} ------"
  human_player.show_state
  player1.show_state
  player2.show_state
  puts "------ READY ? ------"
  gets.chomp

  ### GAMER STARTS
  ### CHOICE BETWEEN ATTACK OR LOOTS (health/weapon)
  ### J'ai utilisé une gem pour pimper l'affichage du CLI
  if player1.life_points > 0 && player2.life_points > 0

    prompt = TTY::Prompt.new
    user_action = prompt.select("Which action do you want to realize ?", ["Loot a weapon", "try to heal", "attack #{player1.name}", "attack #{player2.name}"])
    case user_action
    when "Loot a weapon"
      human_player.search_weapon
    when  "try to heal"
      human_player.search_health_pack
    when  "attack #{player1.name}"
      human_player.attacks(player1)
      puts player1.show_state
    when  "attack #{player2.name}"
      human_player.attacks(player2)
      puts player2.show_state
    end

    ### ON RÉDUIT LES OPTIONS D'ATTAQUE SI PLAYER1 EST MORT
  elsif player1.life_points <= 0 && player2.life_points > 0

    prompt = TTY::Prompt.new
    user_action = prompt.select("Which action do you want to realize ?", ["Loot a weapon", "try to heal", "attack #{player2.name}"])
    case user_action
    when "Loot a weapon"
      human_player.search_weapon
    when  "try to heal"
      human_player.search_health_pack
    when  "attack #{player2.name}"
      human_player.attacks(player2)
      puts player2.show_state
    end

    ### ON RÉDUIT LES OPTIONS D'ATTAQUE SI PLAYER2 EST MORT
  elsif player1.life_points > 0 && player2.life_points <= 0

    prompt = TTY::Prompt.new
    user_action = prompt.select("Which action do you want to realize ?", ["Loot a weapon", "try to heal", "attack #{player1.name}"])
    case user_action
    when "Loot a weapon"
      human_player.search_weapon
    when  "try to heal"
      human_player.search_health_pack
    when  "attack #{player2.name}"
      human_player.attacks(player2)
      puts player2.show_state
    end
  end
  break if player1.life_points <= 0 && player2.life_points <= 0

  puts "------ READY FOR THE NEXT WAVE ? ------"
  gets.chomp
  ### AU TOUR DES PNJ D'ATTAQUER
  ennemies_array.each do |ennemy|
    if ennemy.life_points > 0
      ennemy.attacks(human_player)
      puts human_player.show_state
    end
  end
  break if human_player.life_points <= 0
  round += 1
end

puts "VOUS ÊTES L'HOMME LE PLUS CLASSE DU MONDE. GEORGE ABITBOL SERAIT FIER..."
