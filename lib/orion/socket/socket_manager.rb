require 'singleton'
require 'json'

module Orion
  module Socket
    class SocketManager
      include Singleton

      attr_accessor :sockets

      def init(ws)
        socket = Orion::Socket::Socket.new(ws)
        ws.onopen do
          puts 'WebSocket connection open'
          sockets << socket
        end

        ws.onclose do
          puts 'Connection closed'
          sockets.remove(socket)
        end

        ws.onmessage do |msg|
          begin
            json = JSON.parse(msg)
            Orion::Socket::ActionManager.delegate(socket, json['action'], json['params'])
          rescue JSON::ParserError
            socket.send_error('Message should be in json format')
          end
        end
      end
    end
  end
end