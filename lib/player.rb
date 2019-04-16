class Player
  attr_accessor :name, :life_points
  def initialize(name)
    @name = name
    @life_points = 10
  end

  ### on montre les pv restants
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
    puts "#{@name} attacks #{player_to_attack.name}"
    damage = compute_damage
    player_to_attack.gets_damage(damage)
    puts "#{@name} inflicts #{damage} damages to #{player_to_attack.name} "
  end

  def compute_damage
    return rand(1..6)
  end


end
