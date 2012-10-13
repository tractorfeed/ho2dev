use Rack::Session::Cookie

class PermitMapping < Sinatra::Base
	get '/' do
		erb :index
	end
end
