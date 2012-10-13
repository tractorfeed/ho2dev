use Rack::Session::Cookie

class App < Sinatra::Base
        get '/' do
                erb :index
        end
end
