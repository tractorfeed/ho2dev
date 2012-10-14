require 'rubygems'
require 'bundler'
Bundler.require

# Setup defaults
ROOT = File.expand_path(File.dirname(__FILE__))  

#DataMapper::Logger.new($stdout, :debug)

# A Sqlite3 connection to a persistent database
DataMapper.setup(:default, 'postgres://permitmapping:tUTZhhMLL2R94Z8RoC5Jh465J@elysium.pretendamazing.org/omaha-building-permits')

require 'open-uri'
require 'uri'

# Database stuff
require './lib/models'

# Helper functions
require './lib/helpers'
