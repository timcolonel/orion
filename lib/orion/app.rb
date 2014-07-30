require 'singleton'

module Orion
  class App < Sinatra::Base
    get '/' do
      'Home'
    end

    get '/socket' do
      if request.websocket?
        request.websocket do |ws|
          Orion::socket.init(ws)
        end
      else
        puts 'Error not websocket'
        'Error'
      end
    end
    
    get '/script/:id' do
      Orion::Script::manager.find(params[:id]).to_json  
    end
    
  end
end
