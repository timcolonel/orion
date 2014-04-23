require 'singleton'
require 'json'

module Orion
  class Socket
    include Singleton

    attr_accessor :ws

    def init
      puts 'INIT socket'
      EventMachine.run do
        puts 'Starting event machine'
        EM::WebSocket.start(:host => '0.0.0.0', :port => 3001) do |ws|
          @ws = ws
          puts 'Event machine listening'
          ws.onopen do |handshake|
            puts 'WebSocket connection open'
          end

          ws.onclose do
            puts 'Connection closed'
          end

          ws.onmessage do |msg|
            begin
              json = JSON.parse(msg)
              handle_action(json)
            rescue JSON::ParserError
              send_error('Message should be in json format')
            end
          end
        end
      end
    end

    def send_error(message)
      msg = {:error => true, :msg => message}.to_json
      ws.send msg
    end

    def send_data(data)
      msg = { :data => data }.to_json
      ws.send msg
    end

    def handle_action(json)
      case json['action']
        when 'update_script_list'
          send_data(Orion::Engine::manager.scripts)
        else
          send_error 'Unknown action'
      end
    end


  end
end