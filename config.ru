require 'bundler/setup'
require 'sinatra/base'
#require 'omniauth-twitter'

use Rack::Session::Cookie
#use OmniAuth::Builder do
#	# Assigned to @rossnelson for app HO2 Permit Demo (ID #3423765)
#	twitter_key = 'dqTQIbh2PX7VVqJVPxA'
#	twitter_secret = 'MIwvMi57pMZsaERrIeTkI8I2gOoKh8em8f5xXNdMc'
#	
#	provider :twitter, ENV['TWITTER_KEY'] || twitter_key, ENV['TWITTER_SECRET'] || twitter_secret
#end

class App < Sinatra::Base
	get '/' do
		erb :index
	end
	
	#post '/auth/:name/callback' do
	#	auth = request.env['omniauth.auth']
	#end
end

run App.new
