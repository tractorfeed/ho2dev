require 'rubygems'
require 'bundler'
Bundler.require

# Setup defaults
ROOT = File.expand_path(File.dirname(__FILE__))  

#DataMapper::Logger.new($stdout, :debug)

# A Sqlite3 connection to a persistent database
#DataMapper.setup(:default, "sqlite:///#{ROOT}/data/permits.db")
#DataMapper.setup(:default, 'postgres://postgres:postgres@192.168.2.165/omaha-building-permits')
DataMapper.setup(:default, 'postgres://postgres:idontcare@elysium.pretendamazing.org/omaha-building-permits')
#DataMapper.setup(:default, "sqlite:///tmp/permits.db")

require 'open-uri'
require 'uri'

# Database stuff
require './lib/models'

# Helper functions
require './lib/helpers'
