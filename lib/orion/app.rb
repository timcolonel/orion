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
          ws.onopen do
            json = {:wdawd => 'wdaaw'}.to_json
            ws.send json
            puts 'Socket open'
          end

          ws.onmessage do |msg|
          end

          ws.onclose do
            puts 'websocket closed'
          end
        end
      else
        puts 'Error not websocket'
        'Error'
      end
    end
  end
end