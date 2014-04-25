require 'singleton'

module Orion
  class App< Sinatra::Base
    get '/' do
      'Home'
    end

    get '/socket' do
      puts 'Request /socket'
      if request.websocket?
        request.websocket do |ws|
          Orion::socket.init(ws)
        end
      else
        puts 'Error not websocket'
        'Error'
      end
    end
  end
end