require 'singleton'
require 'json'

module Orion
  class SocketManger
    include Singleton

    attr_accessor :sockets

    def init(ws)
      socket = Orion::Socket.new(ws)
      ws.onopen do
        puts 'WebSocket connection open'
      end

      ws.onclose do
        puts 'Connection closed'
      end

      ws.onmessage do |msg|
        begin
          json = JSON.parse(msg)
          Orion::Socket::ActionManager.delegate(json, socket)
        rescue JSON::ParserError
          socket.send_error('Message should be in json format')
        end
      end
    end
  end
end