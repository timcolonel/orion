require_relative 'socket_manager'
require_relative 'action_manager'

module Orion
  module Socket
    class Socket
      attr_accessor :ws
      alias_method :send, :send_data

      def initialize(ws)
        @ws = ws
      end

      def onopen(&block)
        @ws.onopen(&block)
      end

      def onclose(&block)
        @ws.onclose(&block)
      end

      def send_error(message)
        msg = {:error => true, :msg => message}.to_json
        @ws.send msg
      end

      def send_data(action, data)
        msg = {:action => action, :data => data}.to_json
        @ws.send msg
      end

      def on(action)

      end
    end
  end
end