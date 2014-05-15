require_relative 'socket_manger'
require_relative 'action_manager'

module Orion
  module Socket
    class Socket
      attr_accessor :ws

      def initialize(ws)
        @ws = ws
      end

      def send_error(message)
        msg = {:error => true, :msg => message}.to_json
        @ws.send msg
      end

      def send_data(action, data)
        msg = {:action => action, :data => data}.to_json
        @ws.send msg
      end
    end
  end
end