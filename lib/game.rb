class Game
  attr_accessor :human_player, :ennemies

  def initialize(user_name)
    user_name = gets.chomp
    @human_player = HumanPlayer.new(user_name)
    player1 = Player.new("José")
    player2 = Player.new("George Abitbol")
    player3 = Player.new("Peter")
    player4 = Player.new("Stevens")
    @ennemies = [player1, player2, player3, player4]
  end

  def kill_player(player)
    @ennemies.delete(player)
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && @ennemies.length > 0
  end

  def show_players
    puts "You have #{human_player.life_points} life points left,\n#{ennemies.length} ennemies more to kill"
  end

  def menu
    prompt = TTY::Prompt.new
    user_action = prompt.select("Which action do you want to realize ?",
      ["Loot a weapon", "try to heal",
      "attack #{ennemies[0].name}",
      "attack #{ennemies[1].name}" unless @ennemies.length < 1,
      "attack #{ennemies[2].name}" unless @ennemies.length < 2,
      "attack #{ennemies[3].name}" unless @ennemies.length < 3,
      ])
    end

end
