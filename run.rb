require 'data_mapper'
require 'dm-postgres-adapter'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://makerslaptop82@localhost/databases_1')

require './lib/player'
require './lib/game'
# require './lib/audience'
# require './lib/ball'

DataMapper.finalize
DataMapper.auto_migrate!

game = Game.first
game ||= Game.start("Jeffrey", "Lydia")
game.play
