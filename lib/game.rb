require './lib/printer'

class Game
  include DataMapper::Resource

  property(:id, Serial)
  has(n, :players)
  has(1, :server, 'Player')

  def self.start(player_name_1, player_name_2)
    players = [Player.create(name: player_name_1), Player.create(name: player_name_2)]
    create(players: players)
  end

  def play
    server = set_server
    save
    Printer.new.print_server(server)
    Printer.new.print_winner(random_player)
  end

  private

  def random_player
    [players.first, players.last].sample
  end

  def set_server
    return random_player unless server
    server == players.first ? players.last : players.first
  end
end