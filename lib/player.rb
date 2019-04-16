class Player
  attr_accessor :name, :life_points
  def initialize(name)
    @name = name
    @life_points = 10
  end

  ### on montre les pv restants, ou on annonce la mort d'un joueur si pv <= 0
  def show_state
    if @life_points <= 0
      puts "#{@name} is dead... \n...Monde de merde..."
    else
      puts "#{@name} has #{@life_points} life points left."
    end
  end

  ### on calcule les pv imputés et on renvoit un message en cas de mort du perso
  def gets_damage(x)
    @life_points -= x
  end

  ### calcul des pv
  def attacks(player_to_attack)
    if player_to_attack.life_points > 0
      puts "#{@name} attacks #{player_to_attack.name}"
      damage = compute_damage
      player_to_attack.gets_damage(damage)
      puts "#{@name} inflicts #{damage} damages to #{player_to_attack.name} "
    end
  end

  def compute_damage
    return rand(1..6)
  end
end


########## app 2.0 #########
class HumanPlayer < Player
  attr_accessor :weapon_level
  ### la viariable name bouge pas donc on utilise super(). On redéfinit les autres/nouveaux paramètres
  def initialize(name)
    @weapon_level = 1
    @life_points = 100
    @name = name
  end

  def show_state
    if @life_points <= 0
      puts "#{@name} is dead..."
    else
      puts "#{@name} has #{@life_points} life points left and a weapon of level #{@weapon_level}."
    end
  end

  def compute_damage
    return rand(1..6)*weapon_level
  end

  ### on loot et on compare la valeur du loot à notre arme actuelle
  def search_weapon
    loot = rand(1..6)
    puts "you've found a weapon level #{loot}."
    if loot > @weapon_level
      puts "Yeahhhh this one is way better mate!!"
      @weapon_level = loot
    else
      puts "Forget about it mate, your grandma would be more dangerous barehands..."
    end
  end

  def search_health_pack
    health_loot = rand(1..6)
    case health_loot
    when 1
      puts "It sucks mate...but no health for you !"
    when 2..5
      health_pack = 50
      puts "You just got a 50 life points bonus. Yeahhh"
      ### ternary operator afin de ne pas dépasser les 100pv
      @life_points + health_pack <= 100 ? @life_points += health_pack : @health_pack = 100
    when 6
      health_pack = 80
      puts "Wooooowww lucky you ! +80 life points"
      ### meme chose, mais avec un bonus de 80pv au lieu de 50pv
      @life_points + health_pack <= 100 ? @life_points += health_pack : @health_pack = 100
    end
  end
end
