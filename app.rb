require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("George Abitbol")

### https://www.youtube.com/watch?v=syKRGMbtuvo
puts "------#{player1.name}------\nAh voilà enfin le roi de la classe, l'homme trop bien sapé, Abitbol ! Alors comme ça t'as été élu l'homme le plus classe du monde ! Laisse moi rire ! Style le grand play-boy des fonds marins, genre qui fait rêver les ménagères. Sauf que moi je les baise, moi, les ménagères, non ? C’est pas vrai"
puts "\n------#{player2.name}------\n Écoute-moi bien, mon petit José. Tu baises les ménagères, bien, tu dois avoir le cul qui brille. Mais c’est pas ça qu’on appelle la classe."
puts "\n------#{player1.name}------\nEh, je t’arrête tout de suite. La classe, c’est d’être chic dans sa manière de s’habiller. Rien de tel que d’aller chez Azzedine Alaia ou même de s’acheter des sous-pulls chez Yohji Yamamoto !\nExcuse-moi de te dire ça, mon pauvre José, mais tu confonds un peu tout. Tu fais un amalgame entre la coquetterie et la classe. Tu es fou."
puts "\n------#{player2.name}------\nTu dépenses tout ton argent dans les habits et accessoires de mode mais tu es ridicule. Enfin si ça te plaît. C’est toi qui les portes. Mais moi, si tu veux mon opinion, ça fait un peu… has been."
puts "\n------#{player1.name}------\nLa vache ! Moi, j’ai l’air has been ? J’en ai pour plus d’une barre de fringues sur moi. Alors, va te faire mettre !"
puts "\n... \n           FIGHT !"


### boucle while jusqu'à ce qu'un des deux players gagne
round = 0
until player1.life_points <= 0 || player2.life_points <= 0
  puts "------ ROUND #{round} ------"
  player1.show_state
  player2.show_state
  puts ""

  player1.attacks(player2)
  puts player2.show_state
  break if player2.life_points <= 0

  player2.attacks(player1)
  puts player1.show_state
  round += 1
end


  binding.pry
