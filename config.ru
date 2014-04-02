require 'bundler'
Bundler.require(:default)
require './lib/orion'

#Init engine
#Orion::Engine::manager.init

EventMachine.run do
  EM::WebSocket.start(:host => '0.0.0.0', :port => 3001) do |ws|
    puts 'Starting sockets'
    ws.onopen do |handshake|
      puts 'WebSocket connection open'

      # Access properties on the EM::WebSocket::Handshake object, e.g.
      # path, query_string, origin, headers

      # Publish message to the client
      ws.send "Hello Client, you connected to #{handshake.path}"
    end

    ws.onclose do
      puts 'Connection closed'
    end

    ws.onmessage do |msg|
      puts "Recieved message: #{msg}"
      ws.send "Pong: #{msg}"
    end
  end
end
#Run server
run Orion::App